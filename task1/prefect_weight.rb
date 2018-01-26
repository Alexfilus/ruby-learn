puts "Ваше имя: "
name = gets.chomp

puts "Введите рост: "
height = gets.chomp.to_i

puts "Введите вес: "
weight = gets.chomp.to_i

perfect_weight = height - 110

puts "#{name}, ваш идеальный вес #{perfect_weight}"

if weight < perfect_weight
  puts "Ваш вес уже оптимальный"
end