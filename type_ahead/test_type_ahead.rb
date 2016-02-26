require 'minitest/autorun'
require_relative 'type_ahead'

Text_lines = []
Text_lines << "Mary had a little lamb its fleece was white as snow;"
Text_lines << "And everywhere that Mary went, the lamb was sure to go."
Text_lines << "It followed her to school one day, which was against the rule;"
Text_lines << "It made the children laugh and play, to see a lamb at school."
Text_lines << "And so the teacher turned it out, but still it lingered near,"
Text_lines << "And waited patiently about till Mary did appear."
Text_lines << "Why does the lamb love Mary so? the eager children cry; Why, Mary loves the lamb, you know the teacher did reply."

class TestTypeAhead < Minitest::Test
  def setup
    # filename = './example_file.txt'
    @type_ahead = TypeAhead.new(Text_lines)
  end

  def test_read_file
    assert_equal 89, @type_ahead.words.size
  end
  
  def test_no_non_letters
    assert_equal 59, @type_ahead.words.uniq.size
  end

  def test_n_grams
    expectation = {"lamb" => 3, "teacher" => 2, "children" => 1, "eager" => 1, "rule" => 1}
    actual = @type_ahead.n_grams(2, 'the')
    assert_equal expectation, actual
  end

  def test_2_gram
    # skip
    expectation = "lamb,0.375;teacher,0.250;children,0.125;eager,0.125;rule,0.125"
    actual = @type_ahead.predict("2,the\n")
    assert_equal expectation, actual
  end
end