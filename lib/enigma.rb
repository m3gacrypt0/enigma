require './lib/random_number'
require './lib/random_date'

class Enigma
  attr_reader :message, :key, :date

  def initialize( message,
                  key = RandomNumber.generate(5),
                  date = Date.today.strftime('%d%m%y'))

    @message  = message
    @key      = key
    @date     = date
  end

end
