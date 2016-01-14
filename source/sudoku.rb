#Takes a board as a string in the format
#you see in the puzzle file. Returns
#something representing a board after
#your solver has tried to solve it.

# create sudoku_board array containing all sudoku values
# Define add_number(sudoku_board, index = 0)
#  Iterate through array of numbers 1-9 |number|
#    IF number satisfies check_row(index, number) check_column(index, number) and check_box(index, number).
#      sudoku_board[index] = i
  #    IF sudoku_board[index] == sudoku_board[-1]
  #      return true
  #    ELSE
  #      return add_number(sudoku_board, index +1)
  #    end
#   end
#  end
#  return false
# end

def solved?(board_string)
  board_array = board_to_array(board_string)
  solved_board = add_number?(board_array)
  return solved_board
end
# create sudoku_board array containing all sudoku values
# Define add_number(sudoku_board, index = 0)
#  Iterate through array of numbers 1-9 |number|
#    IF number satisfies check_row(index, number) check_column(index, number) and check_box(index, number).
#      sudoku_board[index] = i
  #    IF sudoku_board[index] == sudoku_board[-1]
  #      return true
  #    ELSE
  #      return add_number(sudoku_board, index +1)
  #    end
#   end
#  end
#  return false
# end


def board_to_array(board_string)
  return board_string.split("").map! { |value| value.to_i }

end

def check_value(index, sudoku_board, possible_value)
  (check_row(index, sudoku_board, possible_value) && check_column(index, sudoku_board, possible_value) && check_box(index, sudoku_board, possible_value))
end

def first_empty_space(board)
  return board.find_index(0)
end


def add_number?(sudoku_board)
  solved_board = []
  if first_empty_space(sudoku_board) == nil
    return sudoku_board
  else
    index = first_empty_space(sudoku_board)
  end

  (1..9).each do |possible_value|
    if check_value(index, sudoku_board, possible_value)
      sudoku_board[index] = possible_value
      sleep 0.05
      #pretty_board(sudoku_board)
      p sudoku_board
      if(solved_board = add_number?(sudoku_board))
        return solved_board
      else
        sudoku_board[index] = 0
      end
    end
  end
  return false
end

def check_row(current_cell_index, board, possible_value)

  # array = Array.new(9) {Array.new(9){" 0 "}}
  # array.each do |row|
  #   row.each_index do |row_index|
  #     if ((row_index + 1) % 3 == 0)
  #       row[row_index] = "#{row[row_index]} |"
  #     end
  #   end
  #   p row
  # end

  temp_array = []
  case current_cell_index
    when 0..8 then (0..8).each {|num|temp_array << board[num]}
    when 9..17 then (9..17).each {|num|temp_array << board[num]}
    when 18..26 then (18..26).each {|num|temp_array << board[num]}
    when 27..35 then (27..35).each {|num|temp_array << board[num]}
    when 36..44 then (36..44).each {|num|temp_array << board[num]}
    when 45..53 then (45..53).each {|num|temp_array << board[num]}
    when 54..62 then (54..62).each {|num|temp_array << board[num]}
    when 63..71 then (63..71).each {|num|temp_array << board[num]}
    when 72..80 then (72..80).each {|num|temp_array << board[num]}
  end
  temp_array.include?(possible_value) ? false : true
end

def check_column(current_cell_index, board, possible_value)
  all_rows = []
  row_array = []
  (0..8).each {|num|row_array << board[num]}
  all_rows << row_array
  row_array = []
  (9..17).each {|num|row_array << board[num]}
  all_rows << row_array
  row_array = []
  (18..26).each {|num|row_array << board[num]}
  all_rows << row_array
  row_array = []
  (27..35).each {|num|row_array << board[num]}
  all_rows << row_array
  row_array = []
  (36..44).each {|num|row_array << board[num]}
  all_rows << row_array
  row_array = []
  (45..53).each {|num|row_array << board[num]}
  all_rows << row_array
  row_array = []
  (54..62).each {|num|row_array << board[num]}
  all_rows << row_array
  row_array = []
  (63..71).each {|num|row_array << board[num]}
  all_rows << row_array
  row_array = []
  (72..80).each {|num|row_array << board[num]}
  all_rows << row_array

  columns_array = all_rows.transpose
  # p columns_array
  columns_array[current_cell_index%9].include?(possible_value) ? false : true
end

def create_boxes
  boxes = {
    :box_1 => [ 0, 1, 2,
        9, 10, 11,
        18, 19, 20 ],

    :box_2 => [ 3, 4, 5,
        12, 13, 14,
        21, 22, 23 ],


    :box_3 => [ 6, 7, 8,
        15, 16, 17,
        24, 25, 26 ],


    :box_4 => [27, 28, 29,
        36, 37, 38,
        45, 46, 47 ],


    :box_5 => [ 30, 31, 32,
        39, 40, 41,
        48, 49, 50 ],


    :box_6 => [ 33, 34, 35,
        42, 43, 44,
        51, 52, 53 ],


    :box_7 => [ 54, 55, 56,
        63, 64, 65,
        72, 73, 74 ],


    :box_8 => [ 57, 58, 59,
        66, 67, 68,
        75, 76, 77 ],


    :box_9 => [ 60, 61, 62,
        69, 70, 71,
        78, 79, 80 ]

    }
end

def find_box(current_cell_index)
  test_box = nil
  boxes = create_boxes

  boxes.each do |box, values|
      values.each do |value|
        if value == current_cell_index
          test_box = box
        end
      end
  end

   return test_box
end


def check_box(current_cell_index, board, possible_value)
  possible = possible_value.to_s
  boxes = create_boxes
  test_box = find_box(current_cell_index)
  new_array = []

  boxes[test_box].each {| num | new_array << board[num]}

  new_array.all? { | value | value != possible}
end

# I

#Returns a boolean indicating whether
#or not the provided board is solved.
#The provided board will be in whatever
#form `solve` returns.
# def solved?(board)
#   if(add_number?(board))
#     puts " _   _                         _
# | | | |                       | |
# | | | |  __      ___   _ _ __ | |
# | | | |  \\ \\ /\\ / / | | | '_ \\| |
# | |_| |   \\ V  V /| |_| | | | |_|
#  \\___/     \\_/\\_/  \\__,_|_| |_(_)

#                                  "
#   end
# end

#Takes in a board in some form and
#returns a string that's well formatted
#for output to the screen. No `puts` here!
#The provided board will be in whatever
#form `solve` returns.

def nest_array(board)
  nested_board = []
  9.times { nested_board << board.slice!(0..8)}
  return nested_board
end


def pretty_board(board)

  array = nest_array(board)
  array.each_with_index do |row, row_index|
    row.each_index do |column_index|
      if ((column_index + 1) % 3 == 0)
        row[column_index] = "#{row[column_index]} |"
        if ((column_index +1) % 9 == 0)
        row[column_index] = "#{row[column_index]}"
        end
      end
    end
    p row.join(" ")
    if((row_index+1)%3==0)
      p ("------------------------")
    end
  end
end

#Takes in a board in some form and
#returns a string in the same format
#as you see in the puzzle file.
#The provided board will be in whatever
#form `solve` returns.


# test_array = ["-", 5, "-", 1,"-", "-",3]


test_array = "1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--".split("")
integer_test_array = test_array.map { |value| value.to_i }

# pretty_board(integer_test_array)

# solve(integer_test_array)

# check_row(10, ["-", 5, "-", 1,"-", "-",3,"-", 5, "-", "-","-", "-","-","-", "-", "-", "-","-", "-"], 3)
