class RobotMovements
  
  def initialize(rows, columns)
    @pathways = []
  end
end

class Path
  attr_reader :rows, :columns, :steps
  
  def initialize(rows, columns, steps = [0, 0])
    @steps = [steps]
    @rows = rows
    @columns = columns
  end
  
  def next_paths
    paths = []
    possible_moves.each do |move|
      paths << Path.new(rows, columns, steps << move)
    end
    paths
  end
  
  def reached_destination?
    @steps[-1] == [rows - 1, columns - 1]
  end
  
  private
  
  def possible_moves
    moves = []
    
    last_step = last_step
    up = increment_step last_step, -1, 0
    down = increment_step last_step, 1, 0
    left = increment_step last_step, 0, -1
    right = increment_step last_step, 0, 1
    
    moves << up if valid_move? up
    moves << down if valid_move? down
    moves << left if valid_move? left
    moves << right if valid_move? right
    moves
  end
  
  def increment_step(step, row_add, column_add)
    [step[0] + row_add, step[1] + column_add]
  end
  
  def last_step
    steps[-1]
  end
  
  def cannot_move_there?(move)
    move[0] < 0 || move[1] < 0 || move[0] > rows || move[1] > columns
  end
  
  def can_move_there?(move)
    !cannot_move_there?(move)
  end
  
  def valid_move?(move)
    can_move_there?(move) && not_been_there?(move)
  end
  
  def not_been_there?(move)
    !been_there?
  end
  
  def been_there?(move)
    @steps.include? move
  end
  
  def can_move?
    possible_moves.empty?
  end
end

movements = RobotMovements.new(4, 4)