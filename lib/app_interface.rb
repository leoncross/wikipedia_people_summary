require_relative 'wiki_api'
require 'colorize'

# handles the interface requirements
class AppInterface

  def introduce
    puts "Welcome, please enter the name of the celebrity you would like to search!".red
    puts "At any time, type 'exit' to exit out of the app".red
    puts "Accepted search format: 'Firstname Lastname' (e.g., John Lennon)".red
    return gets.chomp
  end

end
#
# appin = AppInterface.new
# appin.introduce
