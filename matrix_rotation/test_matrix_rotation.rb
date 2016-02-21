require 'minitest/autorun'
require_relative 'matrix_rotation'

class MatrixTest < Minitest::Test
  def test_1
    assert_equal 'c a d b', Matrix.new('a b c d').rotate
  end
  
  def test_2
    assert_equal 'm i e a n j f b o k g c p l h d', Matrix.new('a b c d e f g h i j k l m n o p').rotate
  end
  
  def test_3
    assert_equal 'g d a h e b i f c', Matrix.new('a b c d e f g h i').rotate
  end
end