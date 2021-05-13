module Passbox
    require 'json'

    def list_of_accounts
        check_passbox
        files_ext = Dir["#{$pbdir}/*.pb"]
        print "\nLogin & Passwords\n".bold.cyan if files_ext.size != 0
        files_ext.each_with_index do |file,i|
            print "#{i+1}. #{file.split('/').last.split('.').first}\n".cyan
        end
        files_ext = Dir["#{$pbdir}/*.pn"]
        print "\nAccount Pins\n".bold.magenta if files_ext.size != 0
        files_ext.each_with_index do |file,i|
            print "#{i+1}. #{file.split('/').last.split('.').first}\n".magenta
        end
        files_ext = Dir["#{$pbdir}/*.cc"]
        print "\nCredit & Debit Cards\n".bold.yellow if files_ext.size != 0
        files_ext.each_with_index do |file,i|
            print "#{i+1}. #{file.split('/').last.split('.').first}\n".yellow
        end
    end

    def verify_account
        print "Please enter you account name: "
        acc = gets.chomp
        files = Dir.glob("#{$pbdir}/#{acc}.*")
        if files.size == 0
            print "Account not found, Use 'passbox list' to see all your existing accounts.\n"
            exit(0)
        elsif files.size == 1
            return files.first
        else
            
        end
        return acc
    end

end