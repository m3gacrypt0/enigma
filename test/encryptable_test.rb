require './test/test_helper'
# require './lib/enigma'
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
    expected =  {:a_key => '02',
                 :b_key => '27',
                 :c_key => '71',
                 :d_key => '15'}
    assert_equal expected, get_keys('02715')
  end

end
