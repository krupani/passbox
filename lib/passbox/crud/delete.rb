module Passbox

    def delete_pass
        check_passbox
        acc = verify_account
        if key
            File.delete("#{$pbdir}/#{acc}")
            print "\nYour account #{acc} has been deleted!!\n\n"
        end
    end

end