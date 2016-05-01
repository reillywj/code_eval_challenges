class TextNumber
  NUMBERS = { 'zero' => 0,
              'one' => 1,
              'two' => 2,
              'three' => 3,
              'four' => 4,
              'five' => 5,
              'six' => 6,
              'seven' => 7,
              'eight' => 8,
              'nine' => 9,
              'ten' => 10,
              'eleven' => 11,
              'twelve' => 12,
              'thirteen' => 13,
              'fourteen' => 14,
              'fifteen' => 15,
              'sixteen' => 16,
              'seventeen' => 17,
              'eighteen' => 18,
              'nineteen' => 19,
              'twenty' => 20,
              'thirty' => 30,
              'forty' => 40,
              'fifty' => 50,
              'sixty' => 60,
              'seventy' => 70,
              'eighty' => 80,
              'ninety' => 90
              }

  MULTIPLES = { 'hundred' => 100,
                'thousand' => 1_000,
                'million' => 1_000_000,
              }

  def self.convert(text)
    words = text.split(' ')
    value = 0
    negative = false
    number_chunk = 0
    
    words.each_with_index do |number, index|
      if number == 'negative'
        negative = true
      else
        if NUMBERS.keys.include? number
          number_chunk += NUMBERS[number]
          value += number_chunk if index >= words.size - 1
        elsif MULTIPLES.keys.include? number
          case number
          when 'hundred'
            number_chunk = number_chunk * MULTIPLES[number]
            value += number_chunk if index >= words.size - 1
          else
            value += number_chunk * MULTIPLES[number]
            number_chunk = 0
          end
        end
      end
    end
    
    negative ? -1 * value : value
  end
end