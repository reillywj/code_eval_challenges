require 'pry'
class ClimbingStairs
  def self.possibilities(number_of_steps)
    n = 1
    paths = [0, 1]
    (number_of_steps).times do
      # binding.pry
      paths = increment(paths)
    end
    paths.last
  end

  def self.increment(paths)
    [paths[1], paths[0] + paths[1]]
  end
end

# # require 'pry'

# class ClimbingStairs
#   def self.possibilities(number_of_steps)
#     unfinished_paths = [Path.new(number_of_steps)]
#     finished_paths = []
#     until unfinished_paths.empty?
#       new_unfinished = []
#       unfinished_paths.each do |path|
#         one_step = path + 1
#         if one_step.finished?
#           finished_paths << one_step
#         else
#           new_unfinished << one_step
#           two_step = path + 2
#           if two_step.finished?
#             finished_paths << two_step
#           else
#             new_unfinished << two_step
#           end
#         end
#       end
#       unfinished_paths = new_unfinished
#       puts unfinished_paths
#     end
#     finished_paths.size
#   end

#   # def self.finished?(paths)
#   #   paths.all?(&:finished?)
#   # end
# end

# class Path
#   attr_reader :max, :step

#   def initialize(max, step=0)
#     @max = max
#     @step = step
#   end

#   # def step_up
#   #   one_step = Path.new max, add_step(1)
#   #   two_steps = Path.new max, add_step(2)
#   #   fork = []
#   #   fork << one_step if one_step.step <= max
#   #   fork << two_steps if two_steps.step <= max
#   #   puts "#{max}: #{fork}"
#   #   fork.empty? ? self : fork
#   # end

#   def +(num)
#     Path.new max, add_step(num)
#   end

#   def finished?
#     step == max
#   end

#   def to_s
#     "Max: #{max}; Step: #{step}"
#   end

#   private

#   def add_step(num)
#     step + num
#   end
# end

# File.read('file.txt').each_line do |line|
#   puts ClimbingStairs.possibilities(line.chomp.to_i)
# end

# puts ClimbingStairs.possibilities(200)