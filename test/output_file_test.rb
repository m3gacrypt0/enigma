require './test/test_helper'
require './lib/output_file'

class OutputFileTest < Minitest::Test

  def setup
    @message = 'This too shall pass.'
    @encryption = 'nhxyutcuuswgflovvsg.'
    @out_file = OutputFile.new
    @enigma = mock('Enigma Object')
    @enigma.stubs(:encrypt).returns({:encryption =>  'nhxyutcuuswgflovvsg.',
                                     :key => '02715',
                                     :date => '040895'})
    @enigma.stubs(:decrypt).returns({:decryption =>  'this too shall pass.',
                                     :key => '02715',
                                     :date => '040895'})
  end

  def test_it_exists
    assert_instance_of OutputFile, @out_file
  end

  def test_method_encrypt_work
    expected =  {:encryption =>  'nhxyutcuuswgflovvsg.',
                 :key => '02715',
                 :date => '040895'}

    assert_equal expected, @out_file.encrypt_work(@enigma, 'test_path.txt', @message)
  end

  def test_method_decrypt_work
    expected =  {:decryption =>  'this too shall pass.',
                 :key => '02715',
                 :date => '040895'}
    assert_equal expected, @out_file.decrypt_work(@enigma, 'test_path.txt', @encryption, '02715', '040895')
  end

end
