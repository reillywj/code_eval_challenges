# Longest lines test
require 'minitest/autorun'
require_relative 'longest_lines'

class LongestLinesTest < Minitest::Test
  def setup
    filename = 'file.txt'
    @lines = LongestLines.new(filename)
  end

  def test_lines_limit
    assert_equal 2, @lines.limit
  end

  def test_all_lines
    assert_equal 5, @lines.all.size
  end
  
  def test_to_s
    assert_equal "San Francisco\nHello World", @lines.to_s
  end
end