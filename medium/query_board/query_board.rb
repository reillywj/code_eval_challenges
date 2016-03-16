class QueryBoard
  attr_reader :board
  SIZE = 256
  
  def initialize
    @board = Array.new(SIZE) { Array.new(SIZE) { 0 } }
  end
  
  def action(command)
    todo = command.chomp.split(' ')
    case todo.first
    when 'SetCol'
      set_column(todo[1].to_i, todo[2].to_i)
    when 'SetRow'
      set_row(todo[1].to_i, todo[2].to_i)
    when 'QueryCol'
      query_column(todo[1].to_i)
    when 'QueryRow'
      query_row(todo[1].to_i)
    end
  end
  
  private
  
  def set_row(row, value)
    SIZE.times do |column|
      @board[row][column] = value
    end
  end
  
  def set_column(column, value)
    SIZE.times do |row|
      @board[row][column] = value
    end
  end
  
  def query_row(row)
    summation = 0
    @board[row].each { |val| summation += val }
    summation
  end
  
  def query_column(column)
    summation = 0
    @board.each { |row| summation += row[column] }
    summation
  end
end
