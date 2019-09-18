require './test/test_helper'
require './lib/enigma'
require './lib/cryptable'

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

  def test_method_character_set?
    character_set = ("a".."z").to_a << " "
    assert @enigma.character_set?("h", character_set)
    refute @enigma.character_set?("1", character_set)
    assert @enigma.character_set?(" ", character_set)
  end

  def test_method_get_index
    character_set = ("a".."z").to_a << " "
    assert_equal 7, @enigma.get_index("h", character_set)
    assert_nil @enigma.get_index("!", character_set)
  end



end
