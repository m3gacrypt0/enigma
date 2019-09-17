require './test/test_helper'
require './lib/random_date'

class RandomDateTest < Minitest::Test

  def setup
    @random_date = RandomDate.new(false)
    @random_date2 = RandomDate.new(true)
  end

  def test_it_exists
    assert_instance_of RandomDate, @random_date
  end

  def test_method_generate
    assert_equal 6, RandomDate.new(false).length
    assert_equal 6, RandomDate.new(true).length
  end

end
