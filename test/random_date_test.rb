require './test/test_helper'
require './lib/random_date'

class RandomDateTest < Minitest::Test

  def setup
    @random_date = RandomDate.new(false)
    @random_date2 = RandomDate.new(true)
    @today = Date.today.strftime('%d%m%y')
  end

  def test_it_exists
    assert_instance_of RandomDate, @random_date
  end

  def test_method_generate
    assert_equal @today, RandomDate.generate(false)
    assert_equal 6, RandomDate.generate(true).length
  end

end
