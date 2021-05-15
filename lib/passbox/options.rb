module Passbox

    def display_add_options
        print "\n1. Password"
        print "\n2. Pin"
        print "\n3. Debit/Credit Card"
        print "\nPlease select one of the above options: " 
        return gets.chomp.to_i
    end

    def select_option
        attempt = 0
        while(true)
            attempt = attempt + 1
            option = display_add_options
            if (1..3).include?(option)
                return option
            else
                print "\nInvalid selection. Please try again!!\n".red
            end
            if attempt==3
                print "\nToo many invalid attempts. Bye!!\n\n".bold.red
                exit(0)
            end
        end
    end

end