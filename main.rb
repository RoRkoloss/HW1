require 'pry'
x_point, y_point, x, y = ARGV
if x_point == x && y_point == y
	puts 'Точка найдена'
elsif x_point != x && y_point == y
	puts 'Близко, но нет'
	puts 'y координата верна, x нет'
elsif x_point == x && y_point != y
	puts 'Близко, но нет'
	puts 'x координата верна, y нет'
end
binding.pry		