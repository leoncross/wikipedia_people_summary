require 'httparty'

class WikiAPI

  def callAPI(name)
    url = 'https://en.wikipedia.org/w/api.php?action=query&prop=revisions&rvprop=content&rvsection=0&titles=' + name + '&format=json'
    response = HTTParty.get(url)
    @result = response.parsed_response
  end

end
