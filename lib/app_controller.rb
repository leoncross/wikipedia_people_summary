require_relative 'wiki_api'

class AppController
  def initialize(wiki_api = WikiAPI.new)
    @wiki_api = wiki_api
  end

  def clean_search_result(search_term)
    search_term = search_term.downcase.split(' ')
    @search_term = search_term[0].capitalize + "_" + search_term[1].capitalize
  end

end
