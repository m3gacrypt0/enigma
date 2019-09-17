require './test/test_helper'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def setup
    @enigma     = Enigma.new
    @today      = Date.today.strftime('%d%m%y')
    @char_set   = ("a".."z").to_a << " "
    @shift_set  = [:a, :b, :c, :d]
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_has_attributes
    assert_equal @char_set, @enigma.instance_variable_get(:@char_set)
    assert_equal @shift_set, @enigma.instance_variable_get(:@shift_set)

  end

  def test_method_encrypt
    expected = {:encryption =>  'keder ohulw',
                :key => '02715',
                :date => '040895'}
    expected2 = {:encryption =>  'keder ohulw!',
                 :key => '02715',
                 :date => '040895'}
    assert_equal expected, @enigma.encrypt("hello world", '02715', '040895')
    assert_equal expected2, @enigma.encrypt("HELLO wORld!", '02715', '040895')
    assert_equal @today, @enigma.encrypt("hello world", "02715")[:date]
    assert_equal @today, @enigma.encrypt("hello world")[:date]
    assert_equal 5, @enigma.encrypt("hello world")[:key].length
  end

  def test_method_decrypt
    expected = {:encryption =>  'hello world',
                :key => '02715',
                :date => '040895'}
    expected2 = {:encryption =>  'HELLO wORld!',
                 :key => '02715',
                 :date => '040895'}
    assert_equal expected, @enigma.decrypt("keder ohulw", '02715', '040895')
    assert_equal expected2, @enigma.decrypt("keder ohulw!", '02715', '040895')
    assert_equal @today, @enigma.decrypt("keder ohulw!", '02715')[:date]
  end

  def test_method_get_shifted_character
    shifts =  {:a => 3,
               :b => 27,
               :c => 73,
               :d => 20}
    assert_equal "k", @enigma.get_shifted_character("h", shifts)
    assert_equal "c", @enigma.get_shifted_character(" ", shifts)
  end

  def test_method_get_rotate
    shifts =  {:a => 3,
               :b => 27,
               :c => 73,
               :d => 20}
    assert_equal 10, @enigma.get_rotate("h", shifts)
    assert_equal 29, @enigma.get_rotate(" ", shifts)
  end

end
