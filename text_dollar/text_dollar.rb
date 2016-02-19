class TextDollar
  NUMBERS = { 0 => '', 1 => "One", 2 => "Two", 3 => "Three", 4 => "Four", 5 => "Five",
              6 => "Six", 7 => "Seven", 8 => "Eight", 9 => "Nine", 10 => "Ten",
              11=> "Eleven", 12 => "Twelve", 13 => "Thirteen", 14 => "Forteen", 15 => "Fifteen",
              20 => "Twenty", 30 => "Thirty", 40 => "Forty", 50 => "Fifty", 60 => "Sixty",
              70 => "Seventy", 80 => "Eighty", 90 => "Ninety" }
  ONES = NUMBERS.select { |number| number < 10 }
  TENS = NUMBERS.select { |number| number % 10 == 0 && number > 0}
  TEENS = NUMBERS.select { |number| number > 10 && number <= 15 }

  def initialize(number)
    @number = number
  end

  def to_s
    "#{convert_to_words}Dollars"
  end

  # private

  def convert_to_words
    return "Zero" if zero?
    return NUMBERS[@number] if NUMBERS[@number]
    case digits
    when 1..3
      convert_thousands
    when 4..6
      convert_millions
    when 7..9
      convert_billions
    end
  end

  def segment_convert(segment)
    return "" if segment == 0
    segment_words = ""
    # Check for teens
    if segment_has_teen? segment
      teen = segment % 100
      segment_words += NUMBERS[teen]
      hundreds = segment / 100
      segment_words = NUMBERS[hundreds] + "Hundred" + segment_words if hundreds > 0

    # Go by digits
    else
      ones = segment % 10
      segment_words += NUMBERS[ones]
      tens = segment % 100 - ones
      segment_words = TENS[tens] + segment_words if TENS[tens]
      hundreds = segment / 100
      segment_words = NUMBERS[hundreds] + "Hundred" + segment_words if hundreds > 0
    end

    segment_words
  end
  
  def convert_thousands
    vals_to_convert = @number % 1000
    segment_convert(vals_to_convert)
  end

  def convert_millions
    vals_to_convert = (@number - @number % 1000) / 1000 % 1000
    # binding.pry if @number > 999999
    segment_converted = segment_convert(vals_to_convert)
    segment_converted += "Thousand" unless segment_converted.empty?
    segment_converted + convert_thousands
  end

  def convert_billions
    vals_to_convert = (@number - @number % 1000000) / 1000000 % 1000
    segment_convert(vals_to_convert) + "Million"+ convert_millions
  end

  def segment_has_teen?(segment)
    !!TEENS[segment % 100]
  end

  def digits
    @digits ||= @number.to_s.size
  end

  def zero?
    @number == 0
  end
end

# lines = %w(3 10 21 466 1234)
# lines.each do |line|
#   puts TextDollar.new(line.to_i)
# end