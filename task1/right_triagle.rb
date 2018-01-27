puts "Введите стороны A, B, C через запятую: "

a, b, c  = gets.split(',').map{|item| item.to_f}.sort.reverse

if a ** 2 == b ** 2 + c ** 2
  puts "Треугольник прямоугольный"
end

if b == c || a==c || a==b
  puts "Треугольник равнобедренный"
  if b == c && a==c && a==b
    puts "Треугольник равносторонний"
  end
end