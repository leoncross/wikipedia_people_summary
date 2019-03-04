require 'httparty'

# communicates and manages the data from the API
class WikiAPI
  def call_api(name)
    url = 'https://en.wikipedia.org/w/api.php?action=query&prop=\
          cirrusbuilddoc&titles=' + name + '&format=json'
    response = HTTParty.get(url)
    @result = response.parsed_response
  end

  def day_of_birth
    return @birth_day = @result.to_s.split(/= {{Birth date/).last[1..10] if
      @result.to_s.split(/= {{Birth date/).last[0..10].gsub(/\D/, '').to_i > 0
    @birth_day = @result.to_s.split(/= {{birth date and age/).last[1..9]
  end

  def format_birthday
    @birth_day = @birth_day[0..8] if @birth_day[-1] == '|'
  end

  def day_of_death
    return @death_day = @result.to_s.split(/{{Death date and age/).last[1..10] if
      @result.to_s.split(/{{Death date and age/).last[1..10].gsub(/\D/, '').to_i > 0
    @death_day = nil
  end

  def format_deathday
    @death_day = @death_day[0..8] if @death_day[-1] == '|'
  end

  def spouce_list
    @spouces = []
    count = @result.to_s.scan(/{{marriage(.+?)\]/)
    count.each_with_index do |_spouce, index|
      result = count[index].to_s.scan(/[ a-zA-Z0-9]+/)
      @spouces << result[0]
    end
    @spouces
  end
end
