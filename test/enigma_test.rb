require './test/test_helper'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new("Hello world", '04567', '160919')
    @enigma2 = Enigma.new("Hello world")
    @enigma3 = Enigma.new("Hello world", '04567')
    # @enigma4 = Enigma.new("Hello world", nil, '160919')
    @today = Date.today.strftime('%d%m%y')
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_has_attributes
    assert_equal "Hello world", @enigma.message
    assert_equal '04567', @enigma.key
    assert_equal '160919', @enigma.date
    assert_equal @today, @enigma2.date
    assert_equal @today, @enigma3.date
    refute_empty @enigma2.key
    # assert_nil @enigma4.key
  end

end
