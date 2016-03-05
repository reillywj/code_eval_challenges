require 'minitest/autorun'
require_relative 'peak_traffic'

class TestPeakTraffic < Minitest::Test
  def setup
    @filename = 'input.txt'
    lines = IO.readlines(@filename).map(&:chomp)
    @interactions = {}
    lines.each do |line|
      split_line = line.split(/\s{4}/)
      @interactions[split_line[1]] = split_line[2] unless @interactions[split_line[1]].include? split_line[2]
    end
  end
end