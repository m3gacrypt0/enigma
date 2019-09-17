require './lib/random_number'
require './lib/random_date'
require './lib/encryptable'

class Enigma
  include Encryptable

  def initialize
    @char_set           = ("a".."z").to_a << " "
    @shift_set          = [:a, :b, :c, :d]
  end

  def encrypt(  message,
                key = RandomNumber.generate(5),
                date = Date.today.strftime('%d%m%y'))
    shifts = get_shifts(key, date)
    encrypted_message  = ""

    to_encrypt = message.downcase.split(//)
    to_encrypt.each do |char|
      if character_set?(char, @char_set)
        encrypted_message += get_shifted_character(char, shifts)
      else
        encrypted_message += char
      end
      @shift_set.rotate!
    end

    @shift_set = [:a, :b, :c, :d]
    {:encryption =>  encrypted_message, :key => key, :date => date}
  end

  def get_shifted_character(char, shifts)
    @char_set.rotate(get_rotate(char, shifts))[0]
  end

  def get_rotate(char, shifts)
    get_index(char, @char_set) + shifts[@shift_set[0]]
  end

end
