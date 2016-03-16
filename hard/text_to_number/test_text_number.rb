require 'minitest/autorun'
require_relative 'text_number.rb'
require 'pry'

class TextNumberTest < Minitest::Test
  def test_short_number_1
    assert_equal 0, TextNumber.convert("zero")
  end

  def test_short_number_2
    assert_equal 5, TextNumber.convert("five")
  end

  def test_short_number_1
    assert_equal 13, TextNumber.convert("thirteen")
  end

  def test_long_number_1
    assert_equal 525, TextNumber.convert("five hundred twenty five")
  end

  def test_long_number_2
    assert_equal 8_756, TextNumber.convert("eight thousand seven hundred fifty six")
  end

  def test_long_number_3
    assert_equal 9_512_000, TextNumber.convert("nine million five hundred twelve thousand")
  end

  def test_sparse_number_1
    assert_equal 3_002_060, TextNumber.convert("three million two thousand sixty")
  end

  def test_negative_number_1
    assert_equal (-3_002_060), TextNumber.convert("negative three million two thousand sixty")
  end
end