alphabet = ('a'..'z').to_a

choral = 'aeiouy'

choral_hash = {}
index = 1
alphabet.each do |letter|
  choral_hash[letter] = index if choral.include? letter
  index += 1
end

puts choral_hash