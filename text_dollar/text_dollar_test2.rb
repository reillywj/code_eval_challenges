require 'minitest/autorun'
require_relative 'text_dollar'

require 'pry'

class TextDollarTest < Minitest::Test
  def test_to_s_1
    assert_equal "TwoHundredEightyEightMillionNineHundredSeventyEightThousandSixHundredEightySevenDollars", TextDollar.new(288978687).to_s
  end
  
  def test_to_s_2
    assert_equal "FiftyNineThousandFourHundredFortyFiveDollars", TextDollar.new(59445).to_s
  end
  
  def test_to_s_3
    assert_equal "TwentyFourThousandEightHundredFortyOneDollars", TextDollar.new(24841).to_s
  end
  
  def test_to_s_4
    assert_equal "TwoHundredFiftyMillionEightHundredNinetyThousandNineHundredThirtyThreeDollars", TextDollar.new(250890933).to_s
  end
  
  def test_to_s_5
    assert_equal "EightHundredNinetyNineDollars", TextDollar.new(899).to_s
  end
  
  def test_to_s_6
    assert_equal "OneHundredTwentyEightDollars", TextDollar.new(128).to_s
  end
  
  def test_to_s_7
    assert_equal "EightyFourThousandFourHundredTwoDollars", TextDollar.new(84402).to_s
  end
  
  def test_to_s_8
    assert_equal "SixHundredSixtyFourDollars", TextDollar.new(664).to_s
  end
  
  def test_to_s_9
    assert_equal "EightHundredThreeDollars", TextDollar.new(803).to_s
  end
  
  def test_to_s_10
    assert_equal "FourHundredFortySixDollars", TextDollar.new(446).to_s
  end
  
  def test_to_s_11
    assert_equal "ThreeHundredThirtyTwoDollars", TextDollar.new(332).to_s
  end
  
  def test_to_s_12
    assert_equal "SevenHundredSixtySixDollars", TextDollar.new(766).to_s
  end
  
  def test_to_s_13
    assert_equal "SixHundredTwentyFourMillionEightHundredNinetyNineThousandOneHundredElevenDollars", TextDollar.new(624899111).to_s
  end
  
  def test_to_s_14
    assert_equal "FourHundredFortyTwoMillionFourHundredThirtyThousandSixHundredThirteenDollars", TextDollar.new(442430613).to_s
  end
  
  def test_to_s_15
    assert_equal "NineHundredEightyOneDollars", TextDollar.new(981).to_s
  end
  
  def test_to_s_16
    assert_equal "NineHundredTwentyEightDollars", TextDollar.new(928).to_s
  end
  
  def test_to_s_17
    assert_equal "NineHundredTwelveDollars", TextDollar.new(912).to_s
  end
  
  def test_to_s_18
    assert_equal "SevenHundredEightySixDollars", TextDollar.new(786).to_s
  end
  
  def test_to_s_19
    assert_equal "OneHundredEightyDollars", TextDollar.new(180).to_s
  end
  
  def test_to_s_20
    assert_equal "TwentyThreeDollars", TextDollar.new(23).to_s
  end
  
  def test_to_s_21
    assert_equal "NinetySevenThousandThreeDollars", TextDollar.new(97003).to_s
  end
  
  def test_to_s_22
    assert_equal "SeventyFourDollars", TextDollar.new(74).to_s
  end
  
  def test_to_s_23
    assert_equal "SixtyOneMillionSevenHundredFiftyTwoThousandEightHundredTwoDollars", TextDollar.new(61752802).to_s
  end
  
  def test_to_s_24
    assert_equal "FiveHundredNineDollars", TextDollar.new(509).to_s
  end
  
  def test_to_s_25
    assert_equal "ThreeHundredSeventyOneMillionFourHundredNinetySixThousandOneHundredSixtyDollars", TextDollar.new(371496160).to_s
  end
  
  def test_to_s_26
    assert_equal "TwentyOneThousandSixHundredFourDollars", TextDollar.new(21604).to_s
  end
  
  def test_to_s_27
    assert_equal "OneHundredMillionDollars", TextDollar.new(100000000).to_s
  end
  
  def test_to_s_28
    assert_equal "SevenHundredFiftyFourMillionTwentySevenThousandTwoHundredThirtyOneDollars", TextDollar.new(754027231).to_s
  end
  
  def test_to_s_29
    assert_equal "OneHundredTwentyThreeMillionFourHundredFiftySixThousandSevenHundredEightyNineDollars", TextDollar.new(123456789).to_s
  end
  
  def test_to_s_30
    assert_equal "ThreeHundredSeventyOneDollars", TextDollar.new(371).to_s
  end
  
  def test_to_s_31
  assert_equal "ThirtySixThousandSixHundredFortyDollars", TextDollar.new(36640).to_s
  end
  
  def test_to_s_32
  assert_equal "FourHundredNinetyNineMillionSevenHundredTwentyEightThousandFourHundredEightySevenDollars", TextDollar.new(499728487).to_s
  end
  
  def test_to_s_33
  assert_equal "SixtyFiveDollars", TextDollar.new(65).to_s
  end
  
  def test_to_s_34
  assert_equal "ThreeHundredEightySixDollars", TextDollar.new(386).to_s
  end
  
  def test_to_s_35
  assert_equal "ThirtyOneMillionThreeHundredThirtyEightThousandFiveHundredEightySixDollars", TextDollar.new(31338586).to_s
  end
  
  def test_to_s_36
  assert_equal "SixHundredSeventyNineMillionSevenHundredSixtyOneThousandEightHundredFiftyTwoDollars", TextDollar.new(679761852).to_s
  end
  
  def test_to_s_37
  assert_equal "ThreeHundredThirtyThreeMillionTwoHundredForteenThousandEightyDollars", TextDollar.new(333214080).to_s
  end
  
  def test_to_s_38
  assert_equal "FiftyNineThousandEightHundredTwentyNineDollars", TextDollar.new(59829).to_s
  end
  
  def test_to_s_39
  assert_equal "OneDollars", TextDollar.new(1).to_s
  end
  
  def test_to_s_40
  assert_equal "FortyEightThousandTwoHundredEightyNineDollars", TextDollar.new(48289).to_s
  end
end