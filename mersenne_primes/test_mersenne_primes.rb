require 'minitest/autorun'
require_relative 'mersenne_primes'

class MersennePrimesTest < Minitest::Test
  def test_four
    assert_equal [3], MersennePrimes.find_numbers(4)
  end
  
  def test_308
    assert_equal [3, 7, 31, 127], MersennePrimes.find_numbers(308)
  end
  
  def test_308_to_s
    assert_equal "3, 7, 31, 127", MersennePrimes.find_numbers_to_s(308)
  end
end