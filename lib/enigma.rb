require './lib/random_number'
require './lib/character_generator'
require './lib/cryptable'
require 'date'

class Enigma
  include Cryptable

  def initialize
    @char_gen   = CharacterGenerator.new
  end

  def encrypt(  message,
                key = RandomNumber.generate(5),
                date = Date.today.strftime('%d%m%y'))

    shifts = get_shifts(key, date)
    to_encrypt = message.downcase.split(//)

    {  :encryption =>  @char_gen.get_shifted_message(to_encrypt, shifts),
       :key => key,
       :date => date}
  end

  def decrypt(  message,
                key,
                date = Date.today.strftime('%d%m%y'))

    shifts = get_shifts(key, date).transform_values! {|v| -v}
    to_decrypt = message.split(//)

    { :decryption =>  @char_gen.get_shifted_message(to_decrypt, shifts),
      :key => key,
      :date => date}
  end

end
