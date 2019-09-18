require './lib/enigma'

class OutputFile

  def initialize
  end

  def self.generate(path, message, type = 'e', key = nil, date = nil)
    out_file = OutputFile.new
    enigma = Enigma.new
    data = out_file.encrypt_work(enigma, path, message) if type == 'e'
    data = out_file.decrypt_work(enigma, path, message, key, date) if type != 'e'
    out_file.to_screen(path, data[:key], data[:date])
  end

  def to_screen(path, key, date)
    puts "Created '#{path}' with the key #{key} and date #{date}"
  end

  def encrypt_work(enigma, path, message)
    data = enigma.encrypt(message)
    writer = File.open(path, "w")
    writer.write(data[:encryption])
    data
  end

  def decrypt_work(enigma, path, message, key, date)
    data = enigma.decrypt(message, key, date)
    writer = File.open(path, "w")
    writer.write(data[:decryption])
    data
  end

end
