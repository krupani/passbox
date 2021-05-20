
module Passbox
    homedir = Dir.home
    $pbdir =  homedir+"/.passbox"
    $passfile = $pbdir+"/pass.mp"
    $options = {1=>"pb", 2=>"pn", 3=>"cc"}

    def init
        pass256=""
        
        if (Dir.exists?($pbdir))
            if(File.exists?($passfile))
                print "Your passbox is already setup. Please type 'passbox help' to see usage.\n"
                return
            else
                pass256 = get_password_from_user(:master)
            end
        else
            pass256 = get_password_from_user(:master)
            Dir.mkdir($pbdir)
        end
        encrypt(pass256, pass256, $passfile)
    end

    def check_passbox
        if !File.exists?($passfile)
            print "Passbox is not setup, please start with 'passbox init' command to start using passbox\n"
        end
    end

end