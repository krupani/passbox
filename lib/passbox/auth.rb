module Passbox
    require 'io/console'
    require 'digest'

    def get_password_from_user(action=:account)
        if (action == :account)
            print "Please enter your account password: "
            return password_input(action)
        elsif (action == :master)
            while(true)
                print "Please create your master password (min 8 chars): "
                pass256 = password_input(action)
                return pass256 if pass256;
            end
        elsif (action == :auth)
            print "Please enter your master password: "
            return password_input(action)
        end
    end

    def password_input(action)
        pass = STDIN.noecho(&:gets).chomp
        if (pass.length < 8 && action != :account) 
            if (action == :master) 
                print "\nPassword should be minimum 8 characters, try again!!\n"
                return false
            elsif (action == :auth)
                print "\nInvalid Password!!\n"
                exit(0)
            end 
        elsif (action == :account)
            print("\n")
            return pass
        else
            print("\n")
            return Digest::SHA256.hexdigest(pass)
        end
    end

    def passbox_auth
        pass256User = get_password_from_user(:auth)
        pass256File = decrypt($passfile, pass256User)
        if pass256File == pass256User
            print("Authentication Successful!!\n")
            return pass256File
        else
            print("Authentication Failed!!\n")
            return false
        end
    end

end