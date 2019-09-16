class RandomNumber
  attr_reader :length

  def initialize(length)
    @length = length
    @source_digits = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def generate
    output = ""
    @length.times { output += get_digit}
    output
  end

  def get_digit
    @source_digits.sample.to_s
  end
end
