require_relative "DecEnc"

puts "Придумайте пароль для шифрования файла"
pussword = gets

puts "Зашифровать файл? 1/0"
puts "1 - Да, 0 - Нет"
answer = gets
if answer.to_i == 1
	enc = DecEnc.new
	enc.encryption
	puts "Файл зашифрован"
	puts "Расшифровать файл? 1/0"
answer1 = gets
if answer1.to_i == 1
	puts "Введите пароль"
	pussword_user = gets
  while pussword_user != pussword
  	puts "Не верный пароль, попробуйте еще"
  	pussword_user = gets
  end

  if pussword_user == pussword	
  	dec = DecEnc.new
	dec.decryption
	puts "Файл расшифрован"
  end
end
if answer1.to_i == 0
	nil
end
end

if answer.to_i == 0
	nil
end
