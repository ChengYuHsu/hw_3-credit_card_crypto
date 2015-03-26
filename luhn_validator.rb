module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)
    # instead of checking the last digit,
    # check if the weighted sum of the digits is a multiple of 10
    nums_a.reverse.zip([1, 2].cycle).reduce(0){ |sum, pair|
    	sum + pair.reduce(:*).divmod(10).reduce(:+)
    } % 10 == 0
  end
end
