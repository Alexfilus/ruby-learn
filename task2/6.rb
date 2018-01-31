basket = Hash.new
sum = 0

loop do
  puts 'Введите название товара (или "стоп"): '
  name = gets.chomp
  break if name == 'стоп'

  puts 'Введите цену товара: '
  price = gets.to_f

  puts 'Введите количество товара: '
  count = gets.to_i

  basket[name] = {'price' => price, 'count' => count}
  sum += price * count
end

puts basket
puts "Итого: #{sum}"