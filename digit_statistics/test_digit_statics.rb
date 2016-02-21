require 'minitest/autorun'
require_relative 'digit_statistics'

class DigitStatisticsTest < Minitest::Test
  def test_info_1
    assert_equal "0: 0, 1: 0, 2: 2, 3: 0, 4: 1, 5: 0, 6: 1, 7: 0, 8: 1, 9: 0", DigitStatistics.new('2 5').info
  end
end