class RandomNumber

  def initialize(length)
    @source_digits = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def self.generate(length)
    random_number = RandomNumber.new(length)
    output = ""
    length.times { output += random_number.get_digit}
    output
  end

  def get_digit
    @source_digits.sample.to_s
  end
end
