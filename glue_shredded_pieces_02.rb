line = "|deEva|lan t|to ha|evil |ankin|il-ev|o hac| to h|vil p|an to|The e|CodeE| evil|plan |hack |Eval |ack C|l ran|king.|l-evi|evil-|-evil|l pla|il pl| hack|al ra|vil-e|odeEv|he ev|n to |ck Co|eEval|nking| rank| Code|e evi|ranki|k Cod| plan|val r|"
require 'pry'
class GluePieces
  attr_reader :first_match_indexes, :second_match_indexes

  def initialize(line)
    @pieces = line.chomp.split("|")
    @pieces.shift
    @index_order = []
    find_first_matches
    find_second_matches
    find_matches
  end

  def find_first_matches
    @first_matches = @pieces.map { |piece| piece[0...(piece.size - 1)] }
  end

  def find_second_matches
    @second_matches = @pieces.map { |piece| piece[1...piece.size] }
  end

  def find_matches
    @first_match_indexes = @first_matches.map { |piece| @second_matches.index piece }
    @second_match_indexes = @second_matches.map { |piece| @first_matches.index piece }
  end

  def find_ordering
    @ancestor = []
    @child = []
    @pieces.each_with_index do |_, index|
      @ancestor << @second_match_indexes.include?(index)
      @child << @first_match_indexes.include?(index)
    end
  end

  def show_matches
    @pieces.each_with_index do |piece, index|
      puts "#{index}> #{piece}: #{@first_match_indexes[index]} -> #{@second_match_indexes[index]}"
    end
  end

  def show_hierarchies
    @pieces.each_with_index do |piece, index|
      puts "#{index}> #{piece}: #{@ancestor[index]} :: #{@child[index]}"
    end
  end
end

gp = GluePieces.new(line)
gp.show_matches
gp.find_ordering
gp.show_hierarchies


