require 'pry'
module NameComparable
  def ==(other)
    name == other.name
  end
end

class President
  attr_reader :file_lines, :number_of_social_issues, :social_issues, :states, :min_winners
  VOTES_TO_WIN = 270

  def initialize(filename)
    @filename = filename
    @file_lines = []
    t0 = Time.now
    read_in_file
    puts "Reading file: #{Time.now - t0}"
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
      issue_combinations = social_issues.combination(num_issues)
      t0 = Time.now
      issue_combinations.each do |set_of_issues|
        @min_winners << set_of_issues if won?(set_of_issues)
      end
      puts "Combination #{num_issues}: #{Time.now - t0}"
      num_issues += 1
    end
    puts "At min winners size: #{@min_winners.size}"
  end
  
  def find_winner
    t0 = Time.now
    find_min_number_of_winners
    puts "Find min number: #{Time.now - t0}"
    t0 = Time.now
    winning_set = find_cheapest_winner
    puts "Find cheapest: #{Time.now - t0}"
    t0 = Time.now
    winning_set.map(&:name).sort.each {|val| puts val}
    puts "Sort and print: #{Time.now - t0}"
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
    line_count = 1
    social_issues_filled_in = false
    @social_issues = []
    @states = {}
    state_line_count = 1
    current_state_name = ''
    
    File.open(@filename).each do |line|
      @number_of_social_issues = line.chomp.split(': ')[-1].to_i if line_count == 1
      
      if line_count >= 3
        if social_issues_filled_in
          if line.chomp.empty?
            state_line_count = 1
          else
            case state_line_count
            when 1
              # State name
              current_state_name = line.chomp
              @states[current_state_name] = State.new(current_state_name)
            when 2
              # State votes
              @states[current_state_name].votes = line.chomp.split(': ')[1].to_i
            else
              # State issues
              @states[current_state_name] << line.chomp
            end
            state_line_count += 1
          end
        else
          if line.chomp.empty?
            social_issues_filled_in = true
          else
            issue, cost = line.chomp.split(': ')
            @social_issues << NationalIssue.new(issue, cost.to_i)
          end
        end
      end
      
      line_count += 1
    end
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
      break if votes_won >= min_to_win
    end
    votes_won >= min_to_win
  end
end

t0 = Time.now
President.new('./sample_3.txt').find_winner
puts Time.now - t0