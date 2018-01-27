puts "Ваше имя: "
name = gets.chomp

puts "Введите рост: "
height = gets.to_i

puts "Введите вес: "
weight = gets.to_i

perfect_weight = height - 110

if weight < perfect_weight
  puts "Ваш вес уже оптимальный"
else
  puts "#{name}, ваш идеальный вес #{perfect_weight}"
end