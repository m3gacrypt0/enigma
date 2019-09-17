require './test/test_helper'
require './lib/enigma'
require './lib/encryptable'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new("hello world", '02715', '040895')
    @enigma2 = Enigma.new("Hello world")
    @enigma3 = Enigma.new("Hello world", '04567')
    # @enigma4 = Enigma.new("Hello world", nil, '160919')
    @today = Date.today.strftime('%d%m%y')

  end

  def test_method_get_keys
    expected =  {:a => 2,
                 :b => 27,
                 :c => 71,
                 :d => 15}
    assert_equal expected, @enigma.get_keys('02715')
  end

  def test_method_get_offsets
    expected =  {:a => 1,
                 :b => 0,
                 :c => 2,
                 :d => 5}
    assert_equal expected, @enigma.get_offsets('040895')
  end

  def test_method_get_shifts
    expected =  {:a => 3,
                 :b => 27,
                 :c => 73,
                 :d => 20}
    assert_equal expected, @enigma.get_shifts('02715', '040895')
  end

end
