# You should re-use and modify your old BoggleBoard class
# to support the new requirements

class BoggleDie
  attr_reader :side_showing

  @@die_faces = [%w(A  A  E  E  G  N),
   %w(E  L  R  T  T  Y),
   %w(A  O  O  T  T  W),
   %w(A  B  B  J  O  O),
   %w(E  H  R  T  V  W),
   %w(C  I  M  O  T  U),
   %w(D  I  S  T  T  Y),
   %w(E  I  O  S  S  T),
   %w(D  E  L  R  V  Y),
   %w(A  C  H  O  P  S),
   %w(H  I  M  N  Qu U),
   %w(E  E  I  N  S  U),
   %w(E  E  G  H  N  W),
   %w(A  F  F  K  P  S),
   %w(H  L  N  N  R  Z),
   %w(D  E  I  L  R  X)]

   def initialize
    @faces = @@die_faces.pop
  end

  def shake!
    @side_showing = @faces.sample
  end

  def to_s
    @side_showing
  end
end


class Score

  def initialize
    @score = score
  end

#   Word length => Points
# <= 2 - 0 pts
#    3 - 1
#    4 - 1
#    5 - 2
#    6 - 3
#    7 - 5
# >= 8 - 11 pts
#   end
end

class BoggleBoard
  attr_accessor :board
  def initialize
    @board = Array.new(4) { Array.new(4) { BoggleDie.new }}
  end

  def shake!
    @board.flatten.each(&:shake!)
    @board = @board.flatten.shuffle.each_slice(4).to_a
  end

  def has_word?(word)
    @word = word.upcase!
    return false if !has_letters?
    (check_rows || check_columns || check_complex)
  end

  def has_letters?
    word.split('').all? { |letter| @board.flatten.map(&:side_showing).include?(letter) }
  end

  def check_rows
    x = @board.any? {|row| row.join == word }
    # puts " the value for check_rows is #{x}"
    # x
    # Split word into array, if row - array == [] return true
  end

  def check_columns
    x = @board.transpose.any? {|row| row.join == word }
    # puts " the value for check_columns is #{x}"
    # x
  end

  def check_complex
    starting_positions = find_letter_indexes(word[0])
    starting_positions.each do |index|

      ## Todo:  make find word return a count of how many letters it found
      return true if find_word(index).count == word.length
    end
    false
    # Check neighbors for a match
    #maybe divmod find coordinates and neighbors
    # to i / XSIZE - j / XSIZE) <= 1

    # && abs(i % XSIZE - j % XSIZE) <= 1)
    ## if it kmows index, row, if its divisible by unless its +-1 index look to the next number +- the rowin board for the corresponding letter starting_position -1, +1,
    # if starting_position -1 or +1
    # Check match's neighbors for match, and that match's neighbors and continue
    # If at any point a match is not found, return false
  end

  def find_word(starting_index, target_word = word)
    return true if target_word.length == 1 # Base Case.  Only one letter left and it can be considered already found
    moves = find_moves(starting_index) # Absolute moves, all invalid moves are deleted
    linear_board = @board.flatten.map(&:side_showing) # Flattened array of just letters
    moves.each_key do |direction|
      index_to_look_at = (starting_index + moves[direction]) # moves[direction] => access moves hash using the key of each direction => (:up, :right, etc)
      if linear_board[index_to_look_at] == target_word[1]
        return find_word(index_to_look_at, target_word[1..-1]) # Letter has been found, call recursively with index and word minus the first letter
      end
    end
    false
  end

  def find_moves(index)
    possible_moves = {left: -1, up: -4, right: 1, down: 4}
    case (index % 4)
    when 0
      possible_moves.delete(:left)
    when 3
      possible_moves.delete(:right)
    end

    case (index / 4)
    when 0
      possible_moves.delete(:up)
    when 3
      possible_moves.delete(:down)
    end
    possible_moves
  end

  def find_letter_indexes(letter)
    # Index of 16 element array
    # index / 4 => row index
    # index % 4 => column index (nested array index)
    indexes = []
    @board.flatten.each_with_index do |die, index|
      indexes << index if die.side_showing == letter
    end
    indexes
  end

  def to_s
    board.map {|row| row.join(" ") }.join("\n")
    # constructed_board = ""
    # @board.each { |row |  constructed_board += row.join(" ") + "\n"}
    # puts constructed_board
  end

  private
  attr_reader :word, :board
end

board = BoggleBoard.new
board.shake!
puts board
puts "Enter a word:"
word = gets.chomp
if board.has_word?(word)
  puts "The board has #{word} in it"
else
  puts "The board does not have #{word} in it"
end
