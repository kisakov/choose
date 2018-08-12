require 'choose/version'
require 'choose/file_processor'

module Choose
  def self.run!
    if ARGV.size == 2
      FileProcessor.move!(ARGV[0], ARGV[1])
    else
      puts "Invalid arguments! Please provide two folders:"
      puts "choose original_folder choosen_folder"
    end
  end
end
