line = "|deEva|lan t|to ha|evil |ankin|il-ev|o hac| to h|vil p|an to|The e|CodeE| evil|plan |hack |Eval |ack C|l ran|king.|l-evi|evil-|-evil|l pla|il pl| hack|al ra|vil-e|odeEv|he ev|n to |ck Co|eEval|nking| rank| Code|e evi|ranki|k Cod| plan|val r|"
require 'pry'
class GluePieces
  attr_reader :pieces

  def initialize(line)
    @pieces = []
    pieces = line.chomp.split("|")
    pieces.shift

    pieces.each_with_index do |piece, index|
      @pieces << Piece.new(piece, index)
    end

    @potential_paths = []
    @potential_relatoinships_found = false
    @potential_paths_found = false
    @pieces_glued = false
  end

  def find_potential_relationships
    return true if @potential_relationships_found

    pieces.each do |piece|
      pieces.each do |other_piece|
        piece.add_ancestor(other_piece) if piece.first == other_piece.last
        piece.add_child(other_piece) if piece.last == other_piece.first
      end
    end

    @potential_relationships_found = true
  end

  def find_potential_paths
    return true if @potential_paths_found
    path = Path.new

    until all_pieces_glued?
      path = Path.new
      path << first_piece
      added_piece = first_piece
      until added_piece == last_piece

      end

    end
    @potential_paths_found = true
  end

  def choose_longest_path
    potential_paths.sort {|a, b| b.size <=> a.size }.first
  end

  def show_potential_hierarchies
    find_potential_relationships

    @pieces.each do |piece|
      puts '-' * 100
      piece.show_potential_hierarchy
    end
  end

  def together
    retur true if @solution_found
    find_potential_relationships
    find_potential_paths
    @solution = choose_longest_path
    @solution_found = true
  end

  def first_piece
    find_potential_paths
    return @first_piece if @first_piece
    @first_piece = pieces.select { |piece| piece.ancestors_empty? }.first
  end

  def last_piece
    find_potential_paths
    return @last_piece if @last_piece
    @last_piece = pieces.select {|piece| piece.children_empty?}.first
  end

  def all_pieces_glued?
    pieces_glued = false
    pieces.each do |piece|
      pieces_glued &&= piece.glued?
    end
    pieces_glued
  end
end

class Piece
  attr_reader :whole, :first, :last, :index
  attr_accessor :actual_ancestor, :actual_child

  def initialize(string, index)
    @whole = string
    @first = string[0...(string.size - 1)]
    @last = string[1...string.size]
    @index = index
    @potential_ancestors = []
    @potential_children = []
    @glued = false
  end

  def to_s
    "#{index}> whole: \"#{whole}\" matcher: \"#{first}\" matchee: \"#{last}\""
  end

  def add_ancestor(other)
    @potential_ancestors << other
  end

  def add_child(other)
    @potential_children << other
  end

  def show_potential_hierarchy
    puts "#{self}"
    puts "Potential Ancestors:"
    @potential_ancestors.each { |ancestor| puts ancestor }
    puts "Potential Children:"
    @potential_children.each { |child| puts child }
  end

  def children_empty?
    @potential_children.empty?
  end

  def ancestors_empty?
    @potential_ancestors.empty?
  end

  def glued?
    @glued
  end

  def glued
    @glued = true
  end
end

class Path
  attr_reader :order
  
  def initialize
    @order = []
  end

  def << index
    @order << index
  end

  def size
    order.size
  end
end

gp = GluePieces.new(line)
gp.show_potential_hierarchies


