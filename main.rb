require 'pp'

require_relative 'board'

board = Chess::Board.new(:human, :ai)
puts board

valid_square = /^[a-hA-H][1-8]$/

def print_help
  puts "    To get info on a piece, enter the square. E.g.\n    > h8"
  puts "    To move a piece, type origin then destination with a space in between. E.g.\n    > b2 b3"
  puts "    To display the board, type “display”, “show”, “print”, “p” or “s”."
  puts "    To exit, type “quit”, “exit” or “q”."
end

line = 1
loop do
  print "> "
  input = gets.chomp

  break if %w(quit exit q).include?(input)

  if valid_square =~ input
    puts board.get_piece_at(input) || "There is no piece on #{input}."
  elsif %w(display show print p s).include?(input)
    puts board
  elsif %w(help ?).include?(input)
    print_help
  else
    puts "This is not a valid command. Type “help” to get help."
  end
end
