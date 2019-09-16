require './test/test_helper'
require './lib/random_number'

class RandomNumberTest < Minitest::Test

  def setup
    @randomnumber = RandomNumber.new(5)
    @randomnumber2 = RandomNumber.new(10)
  end

  def test_it_exists
    assert_instance_of RandomNumber, @randomnumber
  end

  def test_it_has_attributes
    assert_equal 5, @randomnumber.length
  end

  def test_method_generate
    assert_equal 5, @randomnumber.generate.length
    assert_equal 10, @randomnumber2.generate.length
  end

  def test_method_get_digit
    expected = ['0','1','2','3','4','5','6','7','8','9']
    assert_includes expected, @randomnumber.get_digit
    assert_equal 1, @randomnumber.get_digit.length
  end
end
