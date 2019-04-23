require 'openssl'

class DecEnc

  def decryption
    cipher = OpenSSL::Cipher.new('aes-256-cbc')
    cipher.decrypt
    cipher.key = key
    cipher.iv = iv 

    buf = ""
    File.open("file.dec", "wb") do |outf|
      File.open("file.enc", "rb") do |inf|
        while inf.read(4096, buf)
          outf << cipher.update(buf)
        end
        outf << cipher.final
      end
    end
  end


  def encryption
    cipher = OpenSSL::Cipher.new('aes-256-cbc')
    cipher.encrypt
    key = cipher.random_key
    iv = cipher.random_iv

    buf = ""
    File.open("file.enc", "wb") do |outf|
      File.open("file", "rb") do |inf|
        while inf.read(4096, buf)
          outf << cipher.update(buf)
        end
        outf << cipher.final
      end
    end
  end
end
