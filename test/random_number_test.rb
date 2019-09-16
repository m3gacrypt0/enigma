require 'minitest/autorun'
require 'minitest/pride'
require './lib/randomnumber'

class RandomNumberTest < Minitest::Test

  def setup
    @randomnumber = RandomNumber(5)
  end

  def test_it_exists
    assert_instance_of RandomNumber, @randomnumber
  end

  def test_it_has_attributes
    assert_equal 5, @randomnumber.length
  end


end
