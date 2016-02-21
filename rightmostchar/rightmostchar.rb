class RightMostChar
  def initialize(line)
    @string, @char = line.split(',')
  end
  
  def index
    if @string.reverse.index @char
      @string.size - @string.reverse.index(@char) - 1
    else
      -1
    end
  end
end
