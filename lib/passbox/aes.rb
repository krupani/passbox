module Passbox
    require 'openssl'
    def encrypt(data, key, file)
        cipher = OpenSSL::Cipher::AES256.new(:CTR)
        cipher.encrypt
        $iv = cipher.random_iv
        cipher.key = key[0..31]
        encrypted_data = $iv + cipher.update(data) + cipher.final
        file = File.open(file, 'wb')
        file.write(encrypted_data)
        file.close
    end

    def decrypt(datafile, key)
        file = File.open(datafile, 'rb')
        data = file.read
        file.close
        decipher = OpenSSL::Cipher::AES256.new(:CTR)
        decipher.decrypt
        decipher.iv = data[0..15]
        data = data[16..-1]
        decipher.key = key[0..31]
        decrypted_data = decipher.update(data) + decipher.final
        return decrypted_data
    end

end