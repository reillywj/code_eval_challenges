# require 'pry'

class ClimbingStairs
  def self.possibilities(number_of_steps)
    paths = [Path.new(number_of_steps)]
    paths = paths.map(&:step_up).flatten until finished? paths
    paths.size
  end

  def self.finished?(paths)
    paths.all?(&:finished?)
  end
end

class Path
  attr_reader :max

  def initialize(max, steps = [])
    @max = max
    @steps = steps
  end

  def step_up
    one_step = Path.new max, add_step(1)
    two_steps = Path.new max, add_step(2)
    fork = []
    fork << one_step if one_step.level <= max
    fork << two_steps if two_steps.level <= max
    fork.empty? ? self : fork
  end

  def level
    @steps.reduce(:+)
  end

  def finished?
    level == max
  end

  private

  def add_step(num)
    @steps + [num]
  end
end
