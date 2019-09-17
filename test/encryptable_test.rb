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
    expected =  {:a_key => 2,
                 :b_key => 27,
                 :c_key => 71,
                 :d_key => 15}
    assert_equal expected, @enigma.get_keys('02715')
  end

  def test_method_get_offsets
    expected =  {:a_offset => 1,
                 :b_offset => 0,
                 :c_offset => 2,
                 :d_offset => 5}
    assert_equal expected, @enigma.get_offsets('040895')
  end

  def test_method_get_shifts
    expected =  {:a_shift => 3,
                 :b_shift => 27,
                 :c_shift => 73,
                 :d_shift => 20}
    assert_equal expected, @enigma.get_shifts('02715', '040895')
  end

end
