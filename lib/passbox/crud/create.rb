module Passbox

    def create_pass
        check_passbox
        option = select_option
        key = passbox_auth
        acc = create_account(option, key)
        case option
        when 1
            login(acc, key)
        when 2
            pin(acc, key)
        when 3
            cc(acc, key)
        else
            exit(0)
        end
    end

    def create_account(option, key)
        attempts = 0
        while(true)
            if attempts == 3
                print too_many_attempts.bold.red
                exit(0) 
            end
            print enter_account_name
            acc = user_input.downcase
            if (acc.count("a-z0-9_-") == acc.length)
                account_exists = does_account_exists(acc, option)
                if account_exists
                    print account_exists
                    attempts = attempts + 1
                    next;
                end
                break
            else
                print account_name_invalid
                attempts = attempts + 1
            end
        end
        return acc
    end

    def login(acc, key, action=:create)
        attempts = 0
        hash = {}
        while(true)
            if attempts == 3
                print too_many_attempts.bold.red
                exit(0) 
            end
            print enter_username
            uname = user_input
            if (uname == nil)
                if (action == :create)
                    print username_blank
                    attempts = attempts + 1
                    next;
                end
            end
            hash["username"] = uname
            attempts = 0
            pass = get_password_from_user(:account)
            if (pass == nil)
                if (action == :create)
                    print password_blank
                    attempts = attempts + 1
                    next;
                end
            end
            hash["password"] = pass
            break;
        end
        print enter_url
        url = user_input
        hash["url"] = url if url
        print enter_note
        note = user_input
        hash["note"] = note if note
        return hash if action == :update
        json = hash.to_json
        encrypt(json, key, "#{$pbdir}/#{acc}.pb")
        print "Account #{acc} has been successfully created!! \n\n".green
    end

    def pin(acc, key, action = :create)
        attempts = 0
        hash = {}
        while(true)
            if attempts == 3
                print too_many_attempts.bold.red
                exit(0) 
            end
            pass = get_password_from_user(:pin)
            if (pass == nil)
                if (action == :create)
                    print pin_blank
                    attempts = attempts + 1
                    next;
                end
            end
            hash["pin"] = pass
            break;
        end
        print enter_note
        note = user_input
        hash["note"] = note if note
        return hash if action == :update
        json = hash.to_json
        encrypt(json, key, "#{$pbdir}/#{acc}.pn")
        print "Account #{acc} has been successfully created!! \n\n".green
    end

    def cc(acc, key, action = :create)
        attempts = 0
        hash = {}
        while(true)
            if attempts == 3
                print too_many_attempts.bold.red
                exit(0) 
            end
            print enter_cc_no
            cc_no = user_input
            if (cc_no == nil)
                if (action == :create)
                    print cc_no_blank
                    attempts = attempts + 1
                    next;
                end
            end
            hash["card_number"] = cc_no
            attempts = 0
            print enter_cc_exp
            cc_exp = user_input
            if (cc_exp == nil)
                if (action == :create)
                    print cc_exp_blank
                    attempts = attempts + 1
                    next;
                end
            end
            hash["card_expiry"] = cc_exp
            break;
        end
        cc_cvv = get_password_from_user(:cvv)
        hash["card_cvv"] = cc_cvv
        cc_pin = get_password_from_user(:card_pin)
        hash["card_pin"] = cc_pin
        print enter_note
        note = user_input
        hash["note"] = note if note
        return hash if action == :update
        json = hash.to_json
        encrypt(json, key, "#{$pbdir}/#{acc}.cc")
        print "Account #{acc} has been successfully created!! \n\n".green
    end

end