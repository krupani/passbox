module Passbox

    def update_pass
        check_passbox
        acc=verify_account
        key = passbox_auth
        creds(acc,key)
        print "Account details has been successfully updated!! \n"
    end

    # DEPRECATED
    def creds(acc, key)
        print "Please enter in your account username: "
        uname = user_input
        pass = get_password_from_user(:account)
        hash = {:username => uname, :password => pass}
        json = hash.to_json
        encrypt(json, key, "#{$pbdir}/#{acc}.pb")
    end

end