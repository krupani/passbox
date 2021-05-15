module Passbox

    def read_pass
        check_passbox
        filename=verify_account
        key = passbox_auth
        if key
            data = JSON.parse(decrypt(filename, key))
            case filename.split(".").last
            when "pb"
                print "\nusername : #{data['username']}\n"
                print "password : #{data['password']}\n"
                print "url : #{data['url']}\n" if data['url']
                print "note : #{data['note']}\n\n" if data['note']
            when "pn"
                print "\npin : #{data['pin']}\n"
                print "note : #{data['note']}\n\n" if data['note']
            when "cc"
                print "\ncard number : #{data['card_number']}\n"
                print "expiry : #{data['card_expiry']}\n"
                print "cvv : #{data['card_cvv']}\n" if data['card_cvv']
                print "card pin : #{data['card_pin']}\n\n" if data['card_pin']
            end
        end
    end

end