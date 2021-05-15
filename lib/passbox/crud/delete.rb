module Passbox

    def delete_pass
        check_passbox
        filename = verify_account
        key = passbox_auth
        if key
            File.delete(filename)
            print "\nYour account #{filename.split("/").last.split(".").first} has been deleted!!\n\n".bold.yellow
        end
    end

end