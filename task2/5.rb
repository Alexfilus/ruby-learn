puts "Введите день: "
day = gets.to_i
puts "Введите месяц: "
month = gets.to_i
puts "Введите год: "
year = gets.to_i

count_of_days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
count_of_days[1] = 29 if year % 400 == 0 || ( year % 4 == 0 && year % 100 != 0)

sum = day
for i in 0..month - 2
  sum += count_of_days[i]
end

puts "Порядковый номер даты с начала года: #{sum}"