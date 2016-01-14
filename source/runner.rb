require_relative 'sudoku'

# The sudoku puzzles that your program will solve can be found
# in the sudoku_puzzles.txt file.
#
# Currently, Line 18 defines the variable board_string to equal
# the first puzzle (i.e., the first line in the .txt file).

# IMPORTANT:
# After your program can solve this first puzzle, edit
# the code below, so that the program tries to solve
# all of the puzzles.
#
# Remember, the file has newline characters at the end of each line,
# so we call String#chomp to remove them.

#Read the first puzzle


board_string = File.readlines('sudoku_puzzles.txt').last.chomp

solved = []

if (solved = solved?(board_string))
  pretty_board(solved)
  puts " _   _                         _
 | | | |                       | |
 | | | |  __      ___   _ _ __ | |
 | | | |  \\ \\ /\\ / / | | | '_ \\| |
 | |_| |   \\ V  V /| |_| | | | |_|
  \\___/     \\_/\\_/  \\__,_|_| |_(_)

                                  "

else
  puts "Board is not solvable!"
end
