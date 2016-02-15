line = "|deEva|lan t|to ha|evil |ankin|il-ev|o hac| to h|vil p|an to|The e|CodeE| evil|plan |hack |Eval |ack C|l ran|king.|l-evi|evil-|-evil|l pla|il pl| hack|al ra|vil-e|odeEv|he ev|n to |ck Co|eEval|nking| rank| Code|e evi|ranki|k Cod| plan|val r|"
require 'pry'
class GluePieces
  attr_reader :broken_pieces, :starter_piece

  def initialize(line)
    @broken_pieces = line.chomp.split("|")
    @broken_pieces.shift
    @index_order = []
    @glued_pieces = []
    first
    second
    @solution = ''
    @solved = false
  end

  def solve
    starter_piece_index = find_starter_piece_index
    @index_order << starter_piece_index
    last_piece = @broken_pieces[starter_piece_index]
    @solution << last_piece

    until @index_order == @broken_pieces.size - 1 do
      index_of_next_piece = find_next_index(last_piece)
      matched_piece = @broken_pieces[index_of_next_piece]
      @solution << matched_piece[matched_piece.size - 1]
      @index_order << index_of_next_piece
      last_piece = @broken_pieces[index_of_next_piece]
      binding.pry if @index_order.size > 3
    end

    @solved = true
  end

  def first
    @first_set = broken_pieces.map {|piece| piece[0...(piece.size - 1)]}
  end

  def second
    @second_set = broken_pieces.map {|piece| piece[1...piece.size]}
  end

  def find_starter_piece_index
    first_piece = @first_set.select { |piece| !@second_set.include? piece}.pop
    index_of_first_piece = @first_set.index(first_piece)
  end

  def find_next_index(piece)
    index_of_piece = @broken_pieces.index(piece)
    @first_set.index(@second_set[index_of_piece])
  end
end

gp = GluePieces.new(line)
puts gp.broken_pieces
puts '----------'
puts gp.first
puts '-------'
puts gp.second
p gp.find_starter_piece_index
gp.solve
p gp.solution