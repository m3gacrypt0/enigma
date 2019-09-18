require './lib/random_number'
require './lib/cryptable'
require 'date'

class Enigma
  include Cryptable

  def initialize
    @char_set           = ("a".."z").to_a << " "
    @shift_set          = [:a, :b, :c, :d]
  end

  def encrypt(  message,
                key = RandomNumber.generate(5),
                date = Date.today.strftime('%d%m%y'))

    shifts = get_shifts(key, date)
    to_encrypt = message.downcase.split(//)

    {  :encryption =>  get_shifted_message(to_encrypt, shifts),
       :key => key,
       :date => date}
  end

  def decrypt(  message,
                key,
                date = Date.today.strftime('%d%m%y'))

    shifts = get_shifts(key, date).transform_values! {|v| -v}
    to_decrypt = message.split(//)

    { :decryption =>  get_shifted_message(to_decrypt, shifts),
      :key => key,
      :date => date}
  end

  def get_shifted_character(char, shifts)
    @char_set.rotate(get_rotate(char, shifts))[0]
  end

  def get_rotate(char, shifts)
    get_index(char, @char_set) + shifts[@shift_set[0]]
  end

  def get_shifted_message(orig_message, shifts)
    new_message  = ""

    orig_message.each do |char|
      return new_message += char if !character_set?(char, @char_set)
      new_message += get_shifted_character(char, shifts)
      @shift_set.rotate!
    end

    @shift_set = [:a, :b, :c, :d]
    new_message
  end

end
