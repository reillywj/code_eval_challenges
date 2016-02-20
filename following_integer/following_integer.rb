class FollowingInteger
  def initialize(line)
    # @number = line.chomp.to_i
    @number = line
  end
  
  def find_next
    digits = @number.to_s.split('') << '0'
    sequence = digits.permutation.to_a.map(&:join).map(&:to_i).uniq.sort
    sequence[sequence.index(@number) + 1]
  end
end