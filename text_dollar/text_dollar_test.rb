require 'minitest/autorun'
require_relative 'text_dollar'

require 'pry'

class TextDollarTest < Minitest::Test
  def test_to_s_three
    td = TextDollar.new(3)
    assert_equal "ThreeDollars", td.to_s
  end
  
  def test_to_s_one
    # skip
    td = TextDollar.new(1)
    assert_equal "OneDollars", td.to_s
  end
  
  def test_to_s_ten
    # skip
    td = TextDollar.new(10)
    assert_equal "TenDollars", td.to_s
  end
  
  def test_to_s_twelve
    # skip
    td = TextDollar.new(12)
    assert_equal "TwelveDollars", td.to_s
  end
  
  def test_to_s_twenty_one
    # skip
    td = TextDollar.new(21)
    assert_equal "TwentyOneDollars", td.to_s
  end
  
  def test_to_s_466
    # skip
    td = TextDollar.new(466)
    assert_equal "FourHundredSixtySixDollars", td.to_s
  end
  
  def test_to_s_911
    # skip
    td = TextDollar.new(911)
    assert_equal "NineHundredElevenDollars", td.to_s
  end
  
  def test_to_s_1234
    # skip
    td = TextDollar.new(1234)
    assert_equal "OneThousandTwoHundredThirtyFourDollars", td.to_s
  end
  
  def test_to_s_1000
    # skip
    td = TextDollar.new(1000)
    assert_equal "OneThousandDollars", td.to_s
  end
  
  def test_to_s_1000000
    # skip
    td = TextDollar.new(1000000)
    assert_equal "OneMillionDollars", td.to_s
  end
  
  def test_to_s_9513512
    # skip
    td = TextDollar.new(9531512)
    assert_equal "NineMillionFiveHundredThirtyOneThousandFiveHundredTwelveDollars", td.to_s
  end
  
  def test_to_s_700313500
    # skip
    td = TextDollar.new(700313500)
    assert_equal "SevenHundredMillionThreeHundredThirteenThousandFiveHundredDollars", td.to_s
  end

  def test_to_s_1010000
    td = TextDollar.new(1010000)
    assert_equal "OneMillionTenThousandDollars", td.to_s
  end

  def test_to_s_750015001
    td = TextDollar.new(750015001)
    assert_equal "SevenHundredFiftyMillionFifteenThousandOneDollars", td.to_s
  end

  def test_to_s_13
    td = TextDollar.new(13)
    assert_equal "ThirteenDollars", td.to_s
  end
end