require './lib/enigma'

class OutputFile

  def initialize(path, message, type = 'e')
    @filepath   = path
    @message    = message
    @type       = type # 'e' for encrypt; anything else for decrypt
  end

  def self.generate(path, message, type, key = nil, date = nil)
    out_file = OutputFile.new(path, message, type)
    data = out_file.encrypt_work(path, message) if type == 'e'
    data = out_file.decrypt_work(path, message, key, date) if type != 'e'
    out_file.to_screen(path, data[:key], data[:date])
  end

  def to_screen(path, key, date)
    puts "Created '#{path}' with the key #{key} and date #{date}"
  end

  def encrypt_work(path, message)
    enigma = Enigma.new
    data = enigma.encrypt(message)
    writer = File.open(path, "w")
    writer.write(data[:encryption])
    data
  end

  def decrypt_work(path, message, key, date)
    enigma = Enigma.new
    data = enigma.decrypt(message, key, date)
    writer = File.open(path, "w")
    writer.write(data[:decryption])
    data
  end


end
