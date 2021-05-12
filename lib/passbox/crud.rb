module Passbox
    require 'json'

    def verify_account
        print "Please enter you account name: "
        acc = gets.chomp
        if (!File.exists?("#{$pbdir}/#{acc}.pb"))
            print "Account not found, Use 'passbox list' to see all your existing accounts.\n"
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
                print "\nEnter you account name (alphabets/numbers/underscore/dash): "
                acc = gets.chomp.downcase
                if (acc.count("a-z0-9_-") == acc.length) 
                    break
                else
                    print "Alphabets, Numbers, Underscore and Dashes only, try again please!!\n"
                end
            end
        end
        creds(acc,key)
        print "Account #{acc} has been successfully created!! \n"
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
        print "Account details has been successfully updated!! \n"
    end

    def delete_pass
        check_passbox
        acc = verify_account
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