require 'minitest/autorun'
require_relative 'query_board'
require 'pry'

class QueryBoardTest < Minitest::Test
  def setup
    # filename = "file.txt"
    @query = QueryBoard.new
  end
  
  def test_set_row
    @query.action('SetRow 15 7')
    assert_equal 1792, @query.action("QueryRow 15")
  end
  
  def test_set_column
    @query.action('SetCol 2 14')
    assert_equal 3584, @query.action("QueryCol 2")
  end
  
  def test_query_row
    assert_equal 0, @query.action("QueryRow 10")
  end
  
  def test_query_column
    assert_equal 0, @query.action("QueryCol 10")
  end
  
  def test_complex
    @query.action('SetCol 32 20')
    @query.action('SetRow 15 7')
    @query.action('SetRow 16 31')
    assert_equal 5118, @query.action('QueryCol 32')
    
    @query.action('SetCol 2 14')
    assert_equal 34, @query.action('QueryRow 10')
    
    @query.action('SetCol 14 0')
    assert_equal 1792, @query.action('QueryRow 15')
    
    @query.action('SetRow 10 1')
    assert_equal 3571, @query.action('QueryCol 2')
  end
end