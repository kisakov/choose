require 'choose/version'
require 'choose/file_processor'
require 'colorize'

module Choose
  def self.run!
    if ARGV.size == 2
      return puts("#{ARGV[0]} folder doesn't exist!".colorize(:red)) unless Dir.exist?(ARGV[0])
      return puts("#{ARGV[1]} folder doesn't exist!".colorize(:red)) unless Dir.exist?(ARGV[1])

      FileProcessor.move!(ARGV[0], ARGV[1])
    else
      puts "Invalid arguments! Please provide two folders:".colorize(:red)
      puts "choose original_folder choosen_folder".colorize(:green)
    end
  end
end