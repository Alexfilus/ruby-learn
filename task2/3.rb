arr = [0, 1]

fibonacci = 1

while fibonacci < 100
  arr << fibonacci
  fibonacci = arr[-1] + arr[-2]
end

puts arr