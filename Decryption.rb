require 'openssl'

class Decryption
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
