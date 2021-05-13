module Passbox

    def delete_pass
        check_passbox
        acc = verify_account
        if key
            File.delete("#{$pbdir}/#{acc}.pb")
            print("\nAccount #{acc} has been deleted!!")
        end
    end

end