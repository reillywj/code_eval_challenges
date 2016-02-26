require 'pry'

text_lines = []
text_lines << "Mary had a little lamb its fleece was white as snow;"
text_lines << "And everywhere that Mary went, the lamb was sure to go."
text_lines << "It followed her to school one day, which was against the rule;"
text_lines << "It made the children laugh and play, to see a lamb at school."
text_lines << "And so the teacher turned it out, but still it lingered near,"
text_lines << "And waited patiently about till Mary did appear."
text_lines << "Why does the lamb love Mary so? the eager children cry; Why, Mary loves the lamb, you know the teacher did reply."

class Float
  def floor2(exp = 0)
   multiplier = 10 ** exp
   ((self * multiplier).floor).to_f/multiplier.to_f
  end
end

class TypeAhead
  attr_reader :words
  
  def initialize(text_lines)
    @words = []
    # File.open(filename).each do |line|
    #   words = line.chomp.gsub(/[^A-z\s]/,'').split(' ')
    #   @words << words
    # end
    
    text_lines.each do |line|
      words = line.chomp.gsub(/[^A-z\s]/,'').split(' ')
      @words << words
    end
    words.flatten!
  end
  
  def n_grams(n_gram, input_words)
    split_words = input_words.split(' ')
    n_grams_hash = {}

    words.each_with_index do |word, index|
      valid_set = true
      split_words.each_with_index do |split_word, index2|
        valid_set &&= split_word == words[index + index2]
      end

      if valid_set && words[index + 1]
        word_to_add = words[index + n_gram - 1]
        n_grams_hash[word_to_add] = 0 unless n_grams_hash[word_to_add]
        n_grams_hash[word_to_add] += 1
      end
    end
    n_grams_hash
  end

  def predict(user_input)
    n_gram, input_words = user_input.chomp.split(',')
    n_gram_hash = n_grams(n_gram.to_i, input_words)
    n_gram_arr = convert_n_gram_hash(n_gram_hash)
    format_prediction n_gram_arr
  end
  
  def convert_n_gram_hash(hash_input)
    total_grams = 0
    hash_input.each do |_, value|
      total_grams += value
    end
    hash_arr = hash_input.to_a.sort do |a, b|
      result = b[1] <=> a[1]
      result = a[0] <=> b[0] if result == 0
      result
    end
    hash_arr.map do |pair|
      a = pair[0]
      b = (pair[1].to_f / total_grams.to_f).floor2(3)
      [a, sprintf('%0.3f', b)]
    end
  end
  
  def format_prediction(input_arr)
    new_arr = input_arr.map { |pair| pair.join ',' }
    new_arr.join ';'
  end
end

# type_ahead = TypeAhead.new(text_lines)

# File.open('./example_file.txt').each do |line|
#   puts type_ahead.predict line
# end