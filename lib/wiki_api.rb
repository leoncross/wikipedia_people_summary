require 'httparty'

# communicates and manages the data from the API
class WikiAPI
  def call_api(name)
    url = 'https://en.wikipedia.org/w/api.php?action=query&prop=cirrusbuilddoc&titles='
    response = HTTParty.get(url + name + '&format=json')
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
    return if @death_day.nil?
    @death_day = @death_day[0..8] if @death_day[-1] == '|'
  end

  def spouse_list
    @spouces = []
    count = @result.to_s.scan(/{{marriage(.+?)\]/)
    count.each_with_index do |_spouce, index|
      result = count[index].to_s.scan(/[ a-zA-Z0-9]+/)
      @spouces << result[0]
    end
    @spouces
  end

  def summary
    start = 'opening_text'
    finish = 'auxiliary_text'
    @main_summary = @result.to_s[/#{start}(.*?)#{finish}/m, 1]
    @main_summary = @main_summary.gsub!(/[^-–.,!?A-Za-z0-9 ]/, '')[0...-2]
  end
end
