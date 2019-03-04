require_relative 'wiki_api'

class AppController
  def initialize(wiki_api = WikiAPI.new)
    @wiki_api = wiki_api
  end

  def celebrity_search
    clean_search_result(@app_interface.introduce)
    @wiki_api.call_api(result)
    @wiki_api.day_of_birth
    @birth_day = @wiki_api.format_birthday
    @wiki_api.day_of_death
    @death_day = @wiki_api.format_deathday
    @spouse_list = @wiki_api.spouse_list
    @article_summary = @wiki_api.summary
  end

  def clean_search_result(search_term)
    search_term = search_term.downcase.split(' ')
    @celebrity = search_term[0].capitalize + "_" + search_term[1].capitalize
  end

end
