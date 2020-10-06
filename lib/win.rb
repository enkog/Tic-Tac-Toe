class Main
  WINNING_COMBINATION = [
    [0, 1, 2], # top row
    [3, 4, 5], # middle row
    [6, 7, 8], # bottom row
    [0, 4, 8], # left to right diagonal
    [2, 4, 6], # right to left diagonal
    [0, 3, 6], # left-most column
    [1, 4, 7], # middle column
    [2, 5, 8] # right-most column
  ].freeze
end
