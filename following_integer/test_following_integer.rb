require 'minitest/autorun'
require_relative 'following_integer'

class FollowingIntegerTest < Minitest::Test
  def test_find_next_115
    assert_equal 151, FollowingInteger.new(115).find_next
  end
  
  def test_find_next_842
    assert_equal 2048, FollowingInteger.new(842).find_next
  end
  
  def test_find_next_8000
    assert_equal 80000, FollowingInteger.new(8000).find_next
  end
end