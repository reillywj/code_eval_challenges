require 'pry'

module NameComparable
  def ==(other)
    name == other.name
  end
end

class President
  attr_reader :file_lines, :number_of_social_issues, :social_issues, :states

  def initialize(filename)
    @filename = filename
    @file_lines = []
    
    read_in_file
    organize_info
  end

  private

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
  
  def initialize(issue, cost, votes = 0)
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
  end
  
  def <<(social_issue_line) # Format 'Social Issue: votes_count'
    issue, count = social_issue_line.split(': ')
    @social_issues << StateIssue.new(issue, count.to_i)
  end
end