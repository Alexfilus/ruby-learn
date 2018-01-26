puts "Введите коэффициенты A, B, C: "

a = gets.chomp.to_f
b = gets.chomp.to_f
c = gets.chomp.to_f

D = b * b - 4 * a * c

if (D == 0)
  puts "D = #{D}"
  puts 'x = ' + (-b / 2 / a).to_s
else
  if (D > 0)
    puts "D = #{D}"
    puts 'x1 = ' + ((-b - Math.sqrt(D)) / 2 / a).to_s
    puts 'x2 = ' + ((-b + Math.sqrt(D)) / 2 / a).to_s
  else
    puts "D = #{D} => Корней нет"
  end
end