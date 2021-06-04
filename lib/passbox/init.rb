
module Passbox
    homedir = Dir.home
    $pbdir =  homedir+"/.passbox"
    $passfile = $pbdir+"/pass.mp"
    $options = {1=>"pb", 2=>"pn", 3=>"cc"}

    def init
        pass256=""
        
        if (Dir.exists?($pbdir))
            if(File.exists?($passfile))
                print pb_already_setup
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
            print pb_not_setup
            exit(0)
        end
    end

end