puts "Введите коэффициенты A, B, C: "

a = gets.to_f
b = gets.to_f
c = gets.to_f

discriminant = b ** 2 - 4 * a * c
puts "D = #{discriminant}"

if discriminant == 0
  puts "x = #{(-b / 2 / a)}"
elsif discriminant > 0
  discriminant_sqrt = Math.sqrt(discriminant)
  puts "x1 = #{(-b - discriminant_sqrt) / 2 / a}"
  puts "x2 = #{(-b + discriminant_sqrt) / 2 / a}"
else
  puts "Корней нет"
end