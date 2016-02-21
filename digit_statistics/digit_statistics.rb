require 'pry'

class DigitStatistics
  def initialize(line)
    @base, @power = line.chomp.split(' ').map(&:to_i)
    @sequence = []
    initialize_stats
    find_stats
  end
  
  def info
    return_val = ''
    (0..9).each do |number|
      return_val += "#{number}: #{@stats[number]}"
      return_val += ', ' unless number == 9
    end
    return_val
  end
  
  private
  
  def sequence
    return @sequence if @sequence.size == @power
    
    @sequence = []
    (1..@power).each do |power|
      @sequence << @base ** power
    end
    @sequence
  end
  
  def last_digit(num)
    num.to_s[-1].to_i
  end
  
  def initialize_stats
    @stats = {}
    (0..9).each { |num| @stats[num] = 0}
  end
  
  def find_stats
    sequence.each do |number|
      @stats[last_digit(number)] += 1
    end
  end
end