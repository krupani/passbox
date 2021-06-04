module Passbox

    def update_pass
        existing, filename, key = read_pass(:update)
        update_details(existing, filename, key)
        print account_update_success.green
    end

    def update_details(existing, filename, key)
        print update_instructions.yellow
        change_flag = false
        case filename.split(".").last
        when "pb"
            updated = login(nil, key, :update)
            puts existing
            puts updated
            existing["username"] = updated["username"] unless updated["username"].empty?
            existing["password"] = updated["password"] unless updated["password"].empty?
            existing["url"] = updated["url"] unless updated["url"].empty?
            existing["note"] = updated["note"] unless updated["note"].empty?
        when "pn"
            updated = pin(nil, key, :update)
            existing["pin"] = updated["pin"] unless updated["pin"].empty?
            existing["note"] = updated["note"] unless updated["note"].empty?  
        when "cc"
            updated = cc(nil, key, :update)
            existing["card_number"] = updated["card_number"] unless updated["card_number"].empty?
            existing["card_expiry"] = updated["card_expiry"] unless updated["card_expiry"].empty?
            existing["card_cvv"] = updated["card_cvv"] unless updated["card_cvv"].empty?
            existing["card_pin"] = updated["card_pin"] unless updated["card_pin"].empty?
            existing["note"] = updated["note"] unless updated["note"].empty?
        else
            # do nothing
        end
        encrypt(existing.to_json, key, filename)
    end
    
end