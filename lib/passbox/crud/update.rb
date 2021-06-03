module Passbox

    def update_pass
        existing, filename, key = read_pass(:update)
        update_details(existing, filename, key)
        print "\nAccount details has been successfully updated!! \n".green
    end

    def update_details(existing, filename, key)
        print "\nHit enter for no change or input a new value. \n".yellow
        change_flag = false
        case filename.split(".").last
        when "pb"
            updated = login(nil, key, :update)
            existing["username"] = updated["username"] if updated["username"]
            existing["password"] = updated["password"] if updated["password"]
            existing["url"] = updated["url"] if updated["url"]
            existing["note"] = updated["note"] if updated["note"]
        when "pn"
            updated = pin(nil, key, :update)
            existing["pin"] = updated["pin"] if updated["pin"]
            existing["note"] = updated["note"] if updated["note"]  
        when "cc"
            updated = cc(nil, key, :update)
            existing["card_number"] = updated["card_number"] if updated["card_number"]
            existing["card_expiry"] = updated["card_expiry"] if updated["card_expiry"]
            existing["card_cvv"] = updated["card_cvv"] if updated["card_cvv"]
            existing["card_pin"] = updated["card_pin"] if updated["card_pin"]
            existing["note"] = updated["note"] if updated["note"]
        else
            # do nothing
        end
        encrypt(existing.to_json, key, filename)
    end
    
end