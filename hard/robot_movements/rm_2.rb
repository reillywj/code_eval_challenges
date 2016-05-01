require 'pry'

# RobotMovements stores all the possible paths a robot could take
class RobotMovements
  attr_reader :paths, :rows, :columns
  
  def initialize(rows, columns)
    @rows, @columns = rows, columns
    @paths = [Path.new(rows, columns)]
  end

  def find_all_paths
    count = 0
    until all_paths_done? || count > 50000
      # solve for paths
      @paths = paths.map do |path|
        if path.reached_destination?
          path
        else
          path.next_paths
        end
      end.flatten
      count += 1
    end

    paths
  end
  
  def paths_that_reached_destination
    paths.select { |path| path.reached_destination? }
  end

  def paths_that_dead_end
    paths.select { |path| path.dead_end? }
  end

  private

  def all_paths_done?
    done = true
    paths.each do |path|
      done &&= (path.reached_destination? || path.dead_end?)
      break unless done
    end
    done
  end
end

class Path
  attr_reader :rows, :columns

  def initialize(rows, columns, steps = [[0, 0]])
    @rows, @columns = rows, columns
    @steps = steps
  end
  
  def next_paths
    paths = []
    valid_moves.each do |move|
      paths << Path.new(rows, columns, @steps + [move])
    end
    paths
  end

  def reached_destination?
    @steps[-1] == [rows - 1, columns - 1]
  end

  def dead_end?
    valid_moves.empty?
  end

  def valid_moves
    valid_moves = []
    unless reached_destination?
      last_step = last_step
  
      possible_moves.each do |move|
        valid_moves << move if valid_step? move
      end
    end
    
    valid_moves
  end
  
  def possible_moves
    possible_moves = []
    possible_moves << increment_step(last_step, -1, 0)
    possible_moves << increment_step(last_step, 1, 0)
    possible_moves << increment_step(last_step, 0, -1)
    possible_moves << increment_step(last_step, 0, 1)
    possible_moves
  end

  def last_step
    @steps[-1]
  end

  def increment_step(step, row_add, column_add)
    [step[0] + row_add, step[1] + column_add]
  end
  
  def valid_step?(move)
    !(already_visited?(move) || out_of_bounds?(move))
  end
  
  def already_visited?(move)
    @steps.include? move
  end
  
  def out_of_bounds?(move)
    move[0] < 0 || move[1] < 0 || move[0] >= rows || move[1] >= columns
  end
end