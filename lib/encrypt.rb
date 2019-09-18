require './lib/enigma'
require './lib/output_file'

handle = File.open(ARGV[0], "r")

OutputFile.generate(ARGV[1], handle.read, 'e')

handle.close
