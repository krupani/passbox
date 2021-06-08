module Passbox

    def generator_init
        chars = "aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWXyYzZ"
        nums = "0123456789"
        specials = "!@#$^&*()%,+-_.:;<>?/[]{}~|"

        inclusion = chars+nums
        print "Need Special characters in your password? (Y/n): "
        special_chars_flag = user_input.downcase
        inclusion = inclusion + specials if special_chars_flag == "y"
        return inclusion
    end

    def password_size
        attempts = 0
        while(true)
            if attempts == 3
                print too_many_attempts.bold.red
                exit(0) 
            end
            print "Password length(8-25): "
            passlen = user_input.to_i
            if (passlen >= 8 && passlen <= 25)
                return passlen
            else
                print invalid_input.red
                attempts = attempts+1
                next
            end
        end
    end

    def generate
        set = generator_init.split("")
        length = password_size
        pwd = []
        length.times do
            i = rand(set.size-1) 
            set = set.shuffle
            char = set[i]
            set.delete(char)
            pwd.push(char)
        end
        print "\nPassword is: #{pwd.join("")}\n\n"
    end


end