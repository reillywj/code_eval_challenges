class TextDollar
  NUMBERS = {1 => "One", 2 => "Two", 3 => "Three", 4 => "Four", 5 => "Five",
            6 => "Six", 7 => "Seven", 8 => "Eight", 9 => "Nine", 10 => "Ten",
            11=> "Eleven", 12 => "Twelve", 13 => "Thirteen", 14 => "Forteen", 15 => "Fifteen",
            20 => "Twenty", 30 => "Thirty", 40 => "Forty", 50 => "Fifty", 60 => "Sixty"}
  def initialize(number)
    @number = number
  end
  
  def to_s
    "#{convert_to_words}Dollars"
  end
  
  private
  
  def convert_to_words
    return NUMBERS[@number] if NUMBERS[@number]
  end
end