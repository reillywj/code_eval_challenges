require 'minitest/autorun'
require_relative 'president'

class PresidentTest < Minitest::Test
  def setup
    @file_lines = []
    @filename = './example2.txt'
    File.open(@filename).each do |line|
      @file_lines << line.chomp
    end
    
    @president = President.new(@filename)
    @national_issues = []
    issues  = ['Healthcare', 'Immigration', 'Education', 'Energy independence', 'Jobs', 'Taxes', 'The environment', 'Creating jobs', 'Wealth inequality', 'Increase military spending']
    issues.each do |name|
      @national_issues << NationalIssue.new(name)
    end
  end

  def test_number_of_social_issues
    assert_equal 10, @president.number_of_social_issues
  end

  def test_social_issues
    assert_equal @national_issues, @president.social_issues
  end

  def test_states_wyoming
    state = State.new('Wyoming')
    assert_equal state, @president.states['Wyoming'] 
  end

  def test_votes_wyoming
    assert_equal 3, @president.states['Wyoming'].votes
  end
  
  def test_states_wisconsin
    state = State.new('Wisconsin')
    assert_equal state, @president.states['Wisconsin'] 
  end

  def test_votes_wisconsin
    assert_equal 10, @president.states['Wisconsin'].votes
  end
  
  def test_wyoming_min_to_win_state
    assert_equal 2, @president.states['Wyoming'].min_to_win
  end
  
  def test_wyoming_won_state_true_1
    national_issues = [@national_issues[3]]
    assert_equal true, @president.states['Wyoming'].won?(national_issues)
  end
  
  def test_wyoming_won_state_true_2
    national_issues = [@national_issues[3], @national_issues[5]]
    assert_equal true, @president.states['Wyoming'].won?(national_issues)
  end
  
  def test_wyoming_won_state_false
    national_issues = [@national_issues[0]]
    assert_equal false, @president.states['Wyoming'].won?(national_issues)
  end
  
  def test_votes_won_1
    national_issues = [@national_issues[3]]
    assert_equal 3, @president.total_votes(national_issues)
  end
  
  def test_votes_won_all
    assert_equal 36, @president.total_votes(@national_issues)
  end
  
  def test_votes_won_healthcare
    assert_equal 0, @president.total_votes([@national_issues.first])
  end
  
  def test_won_false_1
    assert_equal false, @president.won?([@national_issues.first])
  end
  
  def test_won_true_all
    assert_equal true, @president.won?(@national_issues)
  end
  
  def test_total_cost_1
    assert_equal 76349124, @president.total_cost([@national_issues[0]])
  end
  
  def test_total_cost_all
    assert_equal 502235958, @president.total_cost(@national_issues)
  end
end