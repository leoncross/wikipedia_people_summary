require_relative 'wiki_api'
require 'colorize'

# handles the interface requirements
class AppInterface
  attr_reader :celebrity, :birthdate, :deathdate, :spouse_list, :article_summary

  def introduce
    puts  'Welcome, please enter the name of the celebrity you would like to search!',
          'At any time, type "exit" to exit out of the app',
          'Accepted search format: "Firstname Lastname" (e.g., John Lennon)'
    gets.chomp
  end

  def setup_variables(celebrity, birthdate, deathdate, spouse_list, article_summary)
    @celebrity = celebrity
    @birthdate = birthdate
    @deathdate = deathdate
    @spouse_list = spouse_list
    @article_summary = article_summary
  end

  def print_data
    puts  'Your searched celebrity details are as follows:'.red,
          'Birth date: '.red + @birthdate,
          'Death date: '.red + @deathdate,
          'Spouse: '.red + @spouse_list,
          'Article Summary: '.red + @article_summary
  end
end
