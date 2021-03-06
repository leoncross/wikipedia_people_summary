require_relative 'wiki_api'
require_relative 'app_interface'

# controls the app, and passes data between wiki api and interface
class AppController
  def initialize(wiki_api = WikiAPI.new, app_interface = AppInterface.new)
    @wiki_api = wiki_api
    @app_interface = app_interface
  end

  def celebrity_search_runner
    @celebrity = clean_search_result(@app_interface.introduce)
    wiki_api_process
    @app_interface.setup_variables(
      @celebrity, @birth_day, @death_day, @spouse_list, @article_summary
    )
    @app_interface.print_data
  rescue StandardError
    @app_interface.error_display
  end

  def wiki_api_process
    @wiki_api.call_api(@celebrity)
    @wiki_api.day_of_birth
    @birth_day = @wiki_api.format_birthday
    @wiki_api.day_of_death
    @death_day = @wiki_api.format_deathday
    @spouse_list = @wiki_api.spouse_list
    @article_summary = @wiki_api.summary
  end

  def clean_search_result(search_term)
    search_term = search_term.downcase.split(' ')
    @celebrity = search_term[0].capitalize + '_' + search_term[1].capitalize
  end
end
