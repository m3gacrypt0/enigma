require './lib/enigma'

handle = File.open(ARGV[0], "r")
enigma = Enigma.new
encryption_data = enigma.encrypt(handle.read)
handle.close

writer = File.open(ARGV[1], "w")
writer.write(encryption_data[:encryption])


puts "Created '#{ARGV[1]}' with the key #{encryption_data[:key]} and date #{encryption_data[:date]}"
