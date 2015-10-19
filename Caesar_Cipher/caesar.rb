def caesar_cipher(text, shift)
  alphabet = ('a'..'z').to_a

  result_text = text.split('').map do |char|
    if '!?., '.include?(char)
      char
    else
      ciphered_char = alphabet[(alphabet.index(char.downcase) + shift) % alphabet.size]
      if char == char.upcase
        ciphered_char.upcase
      else
        ciphered_char
      end
    end
  end
  result_text.join
end

print caesar_cipher('What a string!', 5)
