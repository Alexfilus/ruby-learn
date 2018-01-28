puts "Введите стороны A, B, C через запятую: "

sides = gets.split(',').map(&:to_f).sort

if sides[2] ** 2 == sides[0] ** 2 + sides[1] ** 2
  puts "Треугольник прямоугольный"
end

if sides.uniq.size == 2
  puts "Треугольник равнобедренный"
elsif sides.uniq.size == 1
  puts "Треугольник равносторонний"
end