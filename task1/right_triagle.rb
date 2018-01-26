puts "Введите стороны A, B, C через запятую: "

sides = gets.split(',')
hypotenuse = sides.max

cathetus = sides.reject {|item| item == hypotenuse}

if hypotenuse.to_i ** 2 == cathetus[0].to_i ** 2 + cathetus[1].to_i ** 2
  puts "Треугольник прямоугольный"
end

if cathetus[0].to_i == cathetus[1].to_i
  puts "Треугольник равнобедренный"
  if cathetus[0].to_i == hypotenuse.to_i
    puts "Треугольник равносторонний"
  end
end