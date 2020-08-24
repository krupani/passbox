module Passbox
    require 'json'

    def verify_account
        print "Please enter you account name (case-sensitive): "
        acc = gets.chomp
        if (!File.exists?("#{$pbdir}/#{acc}.pb"))
            print "Account not found, Use 'passbox list' to see all existing accounts.\n"
            exit(0)
        end
        return acc
    end

    def creds(acc, key)
        print "Please enter in your account username: "
        uname = gets.chomp
        pass = get_password_from_user(:account)
        hash = {:username => uname, :password => pass}
        json = hash.to_json
        encrypt(json, key, "#{$pbdir}/#{acc}.pb")
    end

    def create_pass
        check_passbox
        key = passbox_auth
        if key
            while(true)
                print "\nEnter you account name (no special characters): "
                acc = gets.chomp
                if (acc.count("a-zA-Z0-9") == acc.length) 
                    break
                else
                    "\nAccount name can only have Alphabets and Numbers (no special characters), try again!!"
                end
            end
        end
        creds(acc,key)
    end

    def read_pass
        check_passbox
        acc=verify_account
        key = passbox_auth
        if key
            data = JSON.parse(decrypt("#{$pbdir}/#{acc}.pb", key))
            print "username : #{data['username']}\n"
            print "password : #{data['password']}\n"
        end
    end

    def update_pass
        check_passbox
        acc=verify_account
        key = passbox_auth
        creds(acc,key)
    end

    def delete_pass
        check_passbox
        acc = verify_account
        key = passbox_auth
        if key
            File.delete("#{$pbdir}/#{acc}.pb")
            print("\nAccount #{acc} has been deleted!!")
        end
    end

    def list_of_accounts
        check_passbox
        files_ext = Dir["#{$pbdir}/*.pb"]
        files_ext.each_with_index do |file,i|
            print "#{i+1}. #{file.split('/').last.split('.').first}\n"
        end
    end

end