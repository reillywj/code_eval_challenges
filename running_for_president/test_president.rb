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
  end

  def test_number_of_social_issues
    assert_equal 10, @president.number_of_social_issues
  end

  def test_social_issues
    issues  = ['Healthcare', 'Immigration', 'Education', 'Energy independence', 'Jobs', 'Taxes', 'The environment', 'Creating jobs', 'Wealth inequality', 'Increase military spending']
    social_issues = []
    issues.each do |issue|
      social_issues << NationalIssue.new(issue, 0)
    end
    assert_equal social_issues, @president.social_issues
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
end