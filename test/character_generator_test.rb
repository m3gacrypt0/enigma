require './test/test_helper'
require './lib/character_generator'

class CharacterGeneratorTest < Minitest::Test

  def setup
    @char_gen = CharacterGenerator.new
    @char_set   = ("a".."z").to_a << " "
    @shift_set  = [:a, :b, :c, :d]
  end

  def test_it_exists
    assert_instance_of CharacterGenerator, @char_gen
  end

  def test_it_has_attributes
    assert_equal @char_set, @char_gen.instance_variable_get(:@char_set)
    assert_equal @shift_set, @char_gen.instance_variable_get(:@shift_set)
  end


  def test_method_get_shifted_character
    shifts =  {:a => 3,
               :b => 27,
               :c => 73,
               :d => 20}
    assert_equal "k", @char_gen.get_shifted_character("h", shifts)
    assert_equal "c", @char_gen.get_shifted_character(" ", shifts)
  end

  def test_method_get_rotate
    shifts =  {:a => 3,
               :b => 27,
               :c => 73,
               :d => 20}
    assert_equal 10, @char_gen.get_rotate("h", shifts)
    assert_equal 29, @char_gen.get_rotate(" ", shifts)
  end

  def test_method_get_shifted_message
    shifts =  {:a => 3,
               :b => 27,
               :c => 73,
               :d => 20}
    orig_message = ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"]
    orig_message2 = ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d", "!"]
    assert_equal "keder ohulw", @char_gen.get_shifted_message(orig_message, shifts)
    assert_equal "keder ohulw!", @char_gen.get_shifted_message(orig_message2, shifts)
  end

end
