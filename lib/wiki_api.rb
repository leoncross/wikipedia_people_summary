require 'httparty'

class WikiAPI

  def callAPI(name)
    url = 'https://en.wikipedia.org/w/api.php?action=query&prop=revisions&rvprop=content&rvsection=0&titles=' + name + '&format=json'
    response = HTTParty.get(url)
    @result = response.parsed_response
  end

  def day_of_birth
    if @result.to_s.split(/= {{Birth date/).last[0..10].gsub(/\D/, '').to_i > 0
      @birth_day = @result.to_s.split(/= {{Birth date/).last[1..10]
    else
      @birth_day = @result.to_s.split(/= {{birth date and age/).last[1..9]
    end
  end

  def format_birthday
    @birth_day = @birth_day[0..8] if @birth_day[-1] == "|"
  end

  def day_of_death

  end

# {{Death date and age|1980|12|8|1940|

end

data = WikiAPI.new
data.callAPI('Hugo_Bergmann')
p data.day_of_birth

data.callAPI('John_Lennon')
p data.day_of_birth
