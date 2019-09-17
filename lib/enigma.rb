require './lib/random_number'
require './lib/random_date'
require './lib/encryptable'

class Enigma
  include Encryptable
  attr_reader :message, :key, :date

  def initialize( message,
                  key = RandomNumber.generate(5),
                  date = Date.today.strftime('%d%m%y'))

    @message  = message
    @key      = key
    @date     = date

  end

  def self.encrypt(message, key, date)
    enigma = Enigma.new(message, key, date)


  end

end
