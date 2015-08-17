def caesar_cipher(text, shift)
	alphabet = ("a".."z").to_a
	
	result_text = ""
	
	text.split("").each do |char|
		if "!?., ".include?(char)
			result_text << char
		else
			ciphered_char = alphabet[(alphabet.index(char.downcase) + shift) % alphabet.size]
			if char == char.upcase
				result_text << ciphered_char.upcase
			else
				result_text << ciphered_char
			end
		end
	end
	return result_text.strip
end

print caesar_cipher("What a string!", 5)