basket = {}
sum = 0

loop do
  puts 'Введите название товара (или "стоп"): '
  name = gets.chomp
  break if name == 'стоп'

  puts 'Введите цену товара: '
  price = gets.to_f

  puts 'Введите количество товара: '
  count = gets.to_f

  basket[name] = { 'price' => price, 'count' => count }
  sum += price * count
end

puts '-' * 49
basket.each_pair { |name, hash| puts "| #{name}#{' ' * (20 - name.length)}| #{hash['price']}#{' ' * (11 - hash['price'].to_s.length)}| #{hash['count']}#{' ' * (11 - hash['count'].to_s.length)}|" }
puts '-' * 49
puts "| Итого: " + " " * 26 + "| #{sum}#{' ' * (11 - sum.to_s.length)}|"
puts '-' * 49