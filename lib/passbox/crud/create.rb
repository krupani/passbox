module Passbox

    def create_pass
        check_passbox
        option = select_option
        acc, key = create_account(option)
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

    def create_account(option)
        key = passbox_auth
        if key
            attempts = 0
            while(true)
                attempts = attempts + 1
                print "\nEnter you account name (alphabets/numbers/underscore/dash): "
                acc = gets.chomp.downcase
                if (acc.count("a-z0-9_-") == acc.length)
                    # TODO: Verify here if account name already exists.. 
                    break
                else
                    print "Alphabets, Numbers, Underscore and Dashes only, try again please!!\n"
                end
                if attempt == 3
                    print "\nToo many attempts. Try again!!\n\n".bold.red
                    exit(0) 
                end
            end
        end
        return acc, key
    end

    def login(acc, key)
        print "Please enter in your account username: "
        uname = gets.chomp
        pass = get_password_from_user(:account)
        hash = {:username => uname, :password => pass}
        print "Enter login url (optional): "
        url = gets.chomp
        hash[:url] = url if url
        print "Enter note to self (optional): "
        note = gets.chomp
        hash[:note] = note if note
        json = hash.to_json
        encrypt(json, key, "#{$pbdir}/#{acc}.pb")
        print "Account #{acc} has been successfully created!! \n\n".green
    end

    def pin(acc, key)
        pass = get_password_from_user(:pin)
        hash = {:pin => pass}
        print "Enter note to self (optional): "
        note = gets.chomp
        hash[:note] = note if note
        json = hash.to_json
        encrypt(json, key, "#{$pbdir}/#{acc}.pn")
        print "Account #{acc} has been successfully created!! \n\n".green
    end

    def cc(acc, key)
        print "Please enter in your credit/debit card number: "
        cc_no = gets.chomp
        print "Please enter your card expiry: "
        cc_exp = gets.chomp
        hash = {:card_number => cc_no, :card_expiry => cc_exp}
        cc_cvv = get_password_from_user(:cvv)
        hash[:card_cvv] => cc_cvv
        cc_pin = get_password_from_user(:card_pin)
        hash[:card_pin] => cc_pin
        json = hash.to_json
        encrypt(json, key, "#{$pbdir}/#{acc}.cc")
        print "Account #{acc} has been successfully created!! \n\n".green
    end

end