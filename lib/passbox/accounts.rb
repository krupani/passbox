module Passbox
    require 'json'

    def list_of_accounts
        check_passbox
        empty = true
        files_ext = Dir["#{$pbdir}/*.pb"]
        print "\nLogin & Passwords\n".bold.cyan if files_ext.size != 0
        files_ext.each_with_index do |file,i|
            print "#{i+1}. #{file.split('/').last.split('.').first}\n".cyan
            empty = false
        end
        files_ext = Dir["#{$pbdir}/*.pn"]
        print "\nAccount Pins\n".bold.magenta if files_ext.size != 0
        files_ext.each_with_index do |file,i|
            print "#{i+1}. #{file.split('/').last.split('.').first}\n".magenta
            empty = false
        end
        files_ext = Dir["#{$pbdir}/*.cc"]
        print "\nCredit & Debit Cards\n".bold.yellow if files_ext.size != 0
        files_ext.each_with_index do |file,i|
            print "#{i+1}. #{file.split('/').last.split('.').first}\n".yellow
            empty = false
        end
        print "\nNo records to show. Use 'passbox add' to create new account.\n\n".yellow if empty
    end

    def verify_account
        print "Please enter you account name: "
        acc = user_input
        files = Dir.glob("#{$pbdir}/#{acc}.{pb,pn,cc}")
        if files.size == 0
            print "Account not found, Use 'passbox list' to see all your existing accounts.\n"
            exit(0)
        elsif files.size == 1
            return files.first
        else
            files.each_with_index do |file, i|
                filename = file.split("/").last.split(".").first
                fileext = file.split("/").last.split(".").last
                case fileext
                when "pb"
                    print "\n#{i+1}: #{filename} - Login & Password Category"
                when "pn"
                    print "\n#{i+1}: #{filename} - Account Pins Category"
                when "cc"
                    print "\n#{i+1}: #{filename} - Credit/Debit Card Category"
                else
                    # do nothing
                end
            end
            print "\nMultiple accounts found, please chose one: "
            option = user_input.to_i
            if (1..files.size).include?(option)
                return files[option-1]
            else
                print "\nInvalid selection. Try again. Bye!!\n\n".red
                exit(0)
            end
        end
    end

    def does_account_exists(acc, type)
        files = Dir.glob("#{$pbdir}/#{acc}.{pb,pn,cc}")
        if files.size == 0
            return false
        else
            files.each do |file| 
                return true if (file.split(".").last == $options[type])
            end
            return false
        end
    end

end