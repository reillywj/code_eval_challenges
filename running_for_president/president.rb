require 'pry'

module NameComparable
  def ==(other)
    name == other.name
  end
end

class President
  attr_reader :file_lines, :number_of_social_issues, :social_issues, :states, :min_winners
  VOTES_TO_WIN = 19

  def initialize(filename)
    @filename = filename
    @file_lines = []
    
    read_in_file
    organize_info
  end
  
  def total_votes(issues)
    votes_won = 0
    states.each do |_, state|
      votes_won += state.votes if state.won?(issues)
    end
    votes_won
  end
  
  def won?(issues)
    total_votes(issues) >= VOTES_TO_WIN
  end
  
  def find_min_number_of_winners
    num_issues = 1
    @min_winners = []
    until !@min_winners.empty? || num_issues >= number_of_social_issues do
      issue_permutations = social_issues.permutation(num_issues)
      issue_permutations.each do |set_of_issues|
        @min_winners << set_of_issues if won?(set_of_issues)
      end
      num_issues += 1
    end
  end
  
  def find_winner
    find_min_number_of_winners
    winning_set = find_cheapest_winner
    winning_set.map(&:name).sort.each {|val| puts val}
  end
  
  def total_cost(set_of_issues)
    cost = 0
    set_of_issues.each do |issue|
      issue_to_add = social_issues.select{|iss| iss == issue}.first
      cost += issue_to_add.cost
    end
    cost
  end

  private
  
  def find_cheapest_winner
    @min_winners.sort { |set_a, set_b| total_cost(set_a) <=> total_cost(set_b) }.first
  end
  
  def read_in_file
    File.open(@filename).each do |line|
      @file_lines << line.chomp
    end
  end
  
  def organize_info
    find_number_of_social_issues
    find_social_issues
    find_all_state_info
  end

  def find_number_of_social_issues
    @number_of_social_issues = file_lines.shift.split(': ')[-1].to_i
    file_lines.shift
  end

  def find_social_issues
    @social_issues = []
    
    until file_lines.first.empty? do
      issue, cost = file_lines.shift.split(': ')
      @social_issues << NationalIssue.new(issue, cost.to_i)
    end
    file_lines.shift
  end
  
  def find_all_state_info
    @states = {}
    until file_lines.empty? do
      find_next_state_info
    end
  end
  
  def find_next_state_info
    state = State.new(file_lines.shift)
    state.votes = file_lines.shift.split(': ')[1].to_i
    until file_lines.empty? || file_lines.first.empty? do
      state << file_lines.shift
    end
    file_lines.shift unless file_lines.empty?
    @states[state.name] = state
  end
end

class NationalIssue
  attr_reader :name, :cost
  include NameComparable
  
  def initialize(issue, cost = 0)
    @name, @cost = issue, cost
  end
end

class StateIssue
  attr_reader :name, :votes
  include NameComparable
  
  def initialize(name, votes)
    @name, @votes = name, votes
  end
end

class State
  attr_reader :name
  attr_accessor :votes, :social_issues
  include NameComparable
  
  def initialize(name)
    @name = name
    @social_issues = []
    @votes = 0
  end
  
  def <<(social_issue_line) # Format 'Social Issue: votes_count'
    issue, count = social_issue_line.split(': ')
    @social_issues << StateIssue.new(issue, count.to_i)
  end
  
  def min_to_win
    @min_to_win ||= (votes/2 + 1)
  end
  
  def won?(issues)
    votes_won = 0
    issues.each do |issue|
      votes_won += @social_issues.select{|iss| iss == issue}.first.votes if @social_issues.include? issue
    end
    votes_won >= min_to_win
  end
end

President.new('./example2.txt').find_winner