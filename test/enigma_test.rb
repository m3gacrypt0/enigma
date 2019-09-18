require './test/test_helper'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def setup
    @enigma     = Enigma.new
    @today      = Date.today.strftime('%d%m%y')
    @char_gen   = CharacterGenerator.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_has_attributes
    assert_instance_of CharacterGenerator, @enigma.instance_variable_get(:@char_gen)
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
    expected = {:decryption =>  'hello world',
                :key => '02715',
                :date => '040895'}
    expected2 = {:decryption =>  'hello world!',
                 :key => '02715',
                 :date => '040895'}
    assert_equal expected, @enigma.decrypt("keder ohulw", '02715', '040895')
    assert_equal expected2, @enigma.decrypt("keder ohulw!", '02715', '040895')
    assert_equal @today, @enigma.decrypt("keder ohulw!", '02715')[:date]
  end

end
