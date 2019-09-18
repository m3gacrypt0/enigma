require './test/test_helper'
require './lib/cryptable'

class CryptableTest < Minitest::Test
  include Cryptable

  def setup
    @char_set = ("a".."z").to_a << " "
  end

  def test_method_get_keys
    expected =  {:a => 2,
                 :b => 27,
                 :c => 71,
                 :d => 15}
    assert_equal expected, get_keys('02715')
  end

  def test_method_get_offsets
    expected =  {:a => 1,
                 :b => 0,
                 :c => 2,
                 :d => 5}
    assert_equal expected, get_offsets('040895')
  end

  def test_method_get_shifts
    expected =  {:a => 3,
                 :b => 27,
                 :c => 73,
                 :d => 20}
    assert_equal expected, get_shifts('02715', '040895')
  end

  def test_method_character_set?
    assert character_set?("h", @char_set)
    refute character_set?("1", @char_set)
    assert character_set?(" ", @char_set)
  end

  def test_method_get_index
    assert_equal 7, get_index("h", @char_set)
    assert_nil get_index("!", @char_set)
  end

end
