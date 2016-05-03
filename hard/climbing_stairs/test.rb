require 'minitest/autorun'
require_relative 'climbing_stairs'

class TestClimbingStairs < Minitest::Test
  def test_1_stair
    assert_equal 1, ClimbingStairs.possibilities(1)
  end

  def test_2_stairs
    assert_equal 2, ClimbingStairs.possibilities(2)
  end

  def test_3_stairs
    # skip
    assert_equal 3, ClimbingStairs.possibilities(3)
  end

  def test_4_stairs
    # skip
    assert_equal 5, ClimbingStairs.possibilities(4)
  end

  def test_10_stairs
    # skip
    assert_equal 89, ClimbingStairs.possibilities(10)
  end

  def test_20_stairs
    # skip
    assert_equal 10_946, ClimbingStairs.possibilities(20)
  end
end