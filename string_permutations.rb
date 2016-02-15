class StringPermutation
  def self.permutate(some_string)
    char_array = split_string(some_string)
    permutation_array = permutations(char_array)
    permutations_to_string(permutation_array)
  end
  
  private
  
  def self.split_string(some_string)
      some_string.split('')
  end

  def self.permutations(chars_array)
    char_perm = chars_array.permutation.to_a
    char_perm.map {|perm| perm.join('')}.sort   
  end

  def self.permutations_to_string(string_array)
    return_str = ''
    string_array.each_with_index do |str, ind|
      return_str << str if ind == 0
      return_str << ", #{str}" unless ind == 0
    end
    return_str
  end
end

# File.open(ARGV[0]).each_line do |line|

# end

a = %w(hat abc Zu6)

b = %w(qemN
oN
hJEf
abc
Cb
jf
xtTH
pS2X
yaC
SmD
iqk
PT7
AeL6
HBL
pRX8
14f
HJuF
uV
nf
Zrf
RG
qRfV
KGf
Y0c2
a06f
A8ei
ko
hUTp
JbtF
8S2n
8Bx
xZ4
hat
Zu6
zD
8jEO
zM7N
9HZO
Z2k
cS)

b.each do |string|
  puts StringPermutation.permutate(string)
end