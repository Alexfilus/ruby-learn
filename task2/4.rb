alphabet = ('a'..'z').to_a

choral = 'aeiouy'

choral_hash = Hash.new
choral.each_char {|curr| choral_hash[alphabet.index(curr) + 1] = curr}

puts choral_hash