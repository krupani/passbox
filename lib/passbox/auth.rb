module Passbox
    require 'io/console'
    require 'digest'

    def get_password_from_user(action=:account)
        case action
        when :account
            print "Please enter your Account Password: "
            return password_input(action)
        when :pin
            print "Please enter you Account Pin: "
            return password_input(action)
        when :cvv
            print "Please enter you Card CVV: "
            return password_input(action)
        when :card_pin
            print "Please enter you Card Pin: "
            return password_input(action)
        when :master
            attempt = 0
            while(true)
                attempt = attempt + 1;
                print "Please create your master password (min 8 chars): "
                pass256 = password_input(action)
                if pass256
                    print "\nPlease re-enter your password: "
                    re_pass256 = password_input(action)
                    if re_pass256 == pass256
                        return pass256 
                    else
                        print "\n\nPasswords don't match. Try again!!\n\n".bold.red
                        exit(0);
                    end
                else
                    print "\nPassword should be minimum 8 characters, try again!!\n".red
                end
                if attempt == 3
                    print "\nToo many attempts. Try again!!\n\n".bold.red
                    exit(0) 
                end
            end
        when :auth
            print "Please enter your Master Password: "
            return password_input(action)
        end
    end

    def password_input(action)
        pass = STDIN.noecho(&:gets).chomp
        case action
        when :master, :auth
            if (pass.length < 8) 
                if (action == :master) 
                    return false
                elsif (action == :auth)
                    print "\nInvalid Password!!\n".bold.red
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
            print "Authentication Successful!!\n".bold.green
            return pass256File
        else
            print "Authentication Failed!!\n".bold.red
            return false
        end
    end

end