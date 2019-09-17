require './test/test_helper'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new("hello world", '02715', '040895')
    @enigma2 = Enigma.new("Hello world")
    @enigma3 = Enigma.new("Hello world", '04567')
    # @enigma4 = Enigma.new("Hello world", nil, '160919')
    @today = Date.today.strftime('%d%m%y')
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_has_attributes
    assert_equal "hello world", @enigma.message
    assert_equal '02715', @enigma.key
    assert_equal '040895', @enigma.date
    assert_equal @today, @enigma2.date
    assert_equal @today, @enigma3.date
    refute_empty @enigma2.key
    # assert_nil @enigma4.key
  end

  def test_method_encrypt
    expected = {:encryption =>  'keder ohulw',
                :key => '02715',
                :date => '040895'}
    assert_equal 'keder ohulw', @enigma.encrypt[:encryption]
    assert_equal '02715', @enigma.encrypt[:key]
    assert_equal '040895', @enigma.encrypt[:date]
  end

end
