require 'minitest/autorun'
require 'minitest/pride'
require './lib/random_number'

class RandomNumberTest < Minitest::Test

  def setup
    @randomnumber = RandomNumber.new(5)
  end

  def test_it_exists
    assert_instance_of RandomNumber, @randomnumber
  end

  def test_it_has_attributes
    assert_equal 5, @randomnumber.length
  end

  def test_method_generate
    assert_equal 5, @randomnumber.generate.length
  end

  def test_method_get_digit
    assert_includes [0, 1, 2, 3, 4, 5, 6, 7, 8, 9], @randomnumber.get_digit
  end
end
