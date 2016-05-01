# Longest lines
class LongestLines
  attr_reader :limit
  
  def initialize(filename)
    count = 0
    @lines = []
    File.open(filename).each do |line|
      count += 1
      @limit = line.chomp.to_i if count == 1
      @lines << line.chomp if count > 1
    end
    @lines.sort! { |a, b| b.size <=> a.size }
  end
  
  def all
    @lines
  end
  
  def to_s
    @lines[0...limit].join("\n")
  end
end