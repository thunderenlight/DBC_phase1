class BoggleBoard
  def initialize
    # letters = ('A'..'Z').to_a.shuffle.first(4 * 4).sort
    # @board = Array.new(4) { letters.sample(4) }
    @board = Array.new(4) { "_" * 4}


  end

  def erase
    @board.clear

  end

  def shake!
    erase
    letters = ('A'..'Z').to_a.shuffle.first(4 * 4).sort
    @board.each do |array|
    array.includes?("Q")
    array.length == 5
    letters.each do |letter|
      if letter == "Q"
        letter = "Qu"
      end
    end
  end
    @board = Array.new(4) { letters.sample(4).map! }

  end

  # Defining to_s on an object controls how the object is
  # represented as a string, e.g., when you pass it to puts
  def to_s
    puts  "board goes here"
     @board.each do |row|
      puts "#{row}"
    end
    # see_me = " "
    # @board.each {|r| see_me += r + "\n" }
  end
end
p bb = BoggleBoard.new
p bb.shake!
puts bb.to_s
