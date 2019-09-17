require './test/test_helper'
require './lib/random_date'

class RandomDateTest < Minitest::Test

  def setup
    @random_date = RandomDate.new
  end

  def test_it_exists
    assert_instance_of RandomDate, @random_date
  end

end
