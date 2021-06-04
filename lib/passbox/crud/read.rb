module Passbox

    def read_pass(action=:display)
        check_passbox
        filename = verify_account 
        key = passbox_auth
    
        if key
            data = JSON.parse(decrypt(filename, key))
            return data, filename, key if (action == :update)
            case filename.split(".").last
            when "pb"
                print "\nusername : #{data['username']}\n"
                print "password : #{data['password']}\n"
                print "url : #{data['url']}\n" if data['url']
                print "note : #{data['note']}\n" if data['note']
                print "\n"
            when "pn"
                print "\npin : #{data['pin']}\n"
                print "note : #{data['note']}\n" if data['note']
                print "\n"
            when "cc"
                print "\ncard number : #{data['card_number']}\n"
                print "expiry : #{data['card_expiry']}\n"
                print "cvv : #{data['card_cvv']}\n" if data['card_cvv']
                print "card pin : #{data['card_pin']}\n" if data['card_pin']
                print "note : #{data['note']}\n" if data['note']
                print "\n"
            end
        end
    end

end