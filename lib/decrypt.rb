require './lib/enigma'

handle = File.open(ARGV[0], "r")
enigma = Enigma.new
decryption_data = enigma.decrypt(handle.read,ARGV[2],ARGV[3])
handle.close

writer = File.open(ARGV[1], "w")
writer.write(decryption_data[:decryption])


puts "Created '#{ARGV[1]}' with the key #{decryption_data[:key]} and date #{decryption_data[:date]}"
