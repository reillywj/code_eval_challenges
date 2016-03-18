class MersennePrimes
  def self.find_numbers(up_to)
    mersenne_primes = []

    index = 1
    until 2 ** index > up_to
      value = 2**index - 1
      puts value
      mersenne_primes << value if self.is_prime? value
      index += 1
    end

    mersenne_primes
  end
  
  def self.find_numbers_to_s(up_to)
    self.find_numbers(up_to).join(', ')
  end

  def self.is_prime?(value)
    return false if value <= 1
    return true if value == 2

    return_value = true

    check_num = 2
    sqrt_num = Math.sqrt(value)
    while check_num <= sqrt_num && return_value
      return_value = false if value % check_num == 0
      check_num += 1
    end

    return_value
  end
end
