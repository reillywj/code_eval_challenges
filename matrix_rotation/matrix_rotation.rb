require 'pry'
class Matrix
  def initialize(letters)
    @letters = letters.split(' ')
    @size_matrix = Math.sqrt(@letters.size).to_i
    @matrix = []
    (0...@size_matrix).each do |row|
      @matrix << @letters[row*@size_matrix, @size_matrix]
    end
  end
  
  def rotate
    solution = []
    temp_matrix = @matrix.map.to_a
    counter = reset_counter
    (@size_matrix * @size_matrix).times do
      solution << temp_matrix[counter].shift
      counter -= 1
      counter = reset_counter if counter < 0
    end

    solution.join(' ')
  end
  
  private
  
  def reset_counter
    @size_matrix - 1
  end
end