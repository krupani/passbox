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
            if acc.empty?
                print account_name_blank.red
                attempts = attempts + 1
                next;
            end
            if (acc.count("a-z0-9_-") == acc.length)
                account_exists = does_account_exists(acc, option)
                if account_exists
                    print account_already_exists.red
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
        hash["username"] = fill_manadatory_field(enter_username, username_blank, action)
        hash["password"] = fill_manadatory_field("", password_blank, action, :account)
        print enter_url
        url = user_input
        hash["url"] = url unless url.empty?
        print enter_note
        note = user_input
        hash["note"] = note unless note.empty?
        return hash if action == :update
        json = hash.to_json
        encrypt(json, key, "#{$pbdir}/#{acc}.pb")
        print "Account #{acc} has been successfully created!! \n\n".green
    end

    def pin(acc, key, action = :create)
        attempts = 0
        hash = {}
        hash["pin"] = fill_manadatory_field("", pin_blank, action, :pin)
        print enter_note
        note = user_input
        hash["note"] = note unless note.empty?
        return hash if action == :update
        json = hash.to_json
        encrypt(json, key, "#{$pbdir}/#{acc}.pn")
        print "Account #{acc} has been successfully created!! \n\n".green
    end

    def cc(acc, key, action = :create)
        attempts = 0
        hash = {}
        hash["card_number"] = fill_manadatory_field(enter_cc_no, cc_no_blank, action)
        hash["card_expiry"] = fill_manadatory_field(enter_cc_exp, cc_exp_blank, action)
        hash["card_cvv"] = fill_manadatory_field("", cc_cvv_blank, action, :cvv)
        cc_pin = get_password_from_user(:card_pin)
        hash["card_pin"] = cc_pin unless cc_pin.empty?
        print enter_note
        note = user_input
        hash["note"] = note unless note.empty?
        return hash if action == :update
        json = hash.to_json
        encrypt(json, key, "#{$pbdir}/#{acc}.cc")
        print "Account #{acc} has been successfully created!! \n\n".green
    end

    def fill_manadatory_field(enter_message, blank_message, action=:create, type=nil)
        attempts = 0
        while(true)
            if attempts == 3
                print too_many_attempts.bold.red
                exit(0) 
            end
            if (type.nil?)
                print enter_message
                field = user_input
            else
                field = get_password_from_user(type)
            end
            if field.empty?
                if (action == :create)
                    print blank_message.red
                    attempts = attempts + 1
                    next;
                end
            end
            return field  
        end
    end

end