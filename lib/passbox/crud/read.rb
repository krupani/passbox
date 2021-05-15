module Passbox

    def read_pass
        check_passbox
        acc=verify_account
        key = passbox_auth
        if key
            data = JSON.parse(decrypt("#{$pbdir}/#{acc}", key))
            print "username : #{data['username']}\n"
            print "password : #{data['password']}\n"
        end
    end

end