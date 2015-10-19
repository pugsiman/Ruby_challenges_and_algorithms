def substrings(counted_word, words_array)
  words_listing = Hash.new(0)

  words_array.each do |word|
    counted_word.downcase.scan(word.downcase) { words_listing[word] += 1 }
  end

  words_listing
end

dictionary = %w(below down go going horn how howdy it i low own part partner sit)

print substrings('below', dictionary)
print substrings("Howdy partner, sit down! How's it going?", dictionary)
