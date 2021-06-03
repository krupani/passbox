module Passbox
    require 'io/console'
    require 'digest'

    def get_password_from_user(action=:account)
        case action
        when :account
            print enter_account_password
            return password_input(action)
        when :pin
            print enter_account_pin
            return password_input(action)
        when :cvv
            print enter_cc_cvv
            return password_input(action)
        when :card_pin
            print enter_cc_pin
            return password_input(action)
        when :master
            attempt = 0
            while(true)
                attempt = attempt + 1;
                print create_master_password
                pass256 = password_input(action)
                if pass256
                    print re_enter_master_password
                    re_pass256 = password_input(action)
                    if re_pass256 == pass256
                        print pb_setup_complete.bold.green
                        return pass256 
                    else
                        print passwords_mismatch.bold.red
                        exit(0);
                    end
                else
                    print password_validation.red
                end
                if attempt == 3
                    print too_many_attempts.bold.red
                    exit(0) 
                end
            end
        when :auth
            print enter_master_password
            return password_input(action)
        end
    end

    def password_input(action)
        begin
            pass = STDIN.noecho(&:gets).chomp
        rescue Interrupt
            puts thank_you.cyan
            exit(0)
        end
        case action
        when :master, :auth
            if (pass.length < 8) 
                if (action == :master) 
                    return false
                elsif (action == :auth)
                    print invalid_password.bold.red
                    exit(0)
                end 
            else
                return Digest::SHA256.hexdigest(pass)
            end
        else
            print("\n")
            return pass
        end
    end

    def passbox_auth
        pass256User = get_password_from_user(:auth)
        pass256File = decrypt($passfile, pass256User)
        if pass256File == pass256User
            print auth_success.bold.green
            return pass256File
        else
            print auth_failed.bold.red
            exit(0)
        end
    end

end