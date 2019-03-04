require 'wiki_api'
require 'helpers'

johnlennon = JSON.parse(File.read("./json_examples/john_lennon.json"))
hugobergmann = JSON.parse(File.read("./json_examples/hugo_bergmann.json"))
sethrogen = JSON.parse(File.read("./json_examples/seth_rogen.json"))


describe WikiAPI do
  wiki_api = WikiAPI.new

  context 'callAPI' do
    it 'stubs API call and returns an empty hash' do
      mock_API_call(johnlennon)
      expect(wiki_api.callAPI('John_Lennon')).to eq johnlennon
    end
  end

  context 'day_of_birth' do
    it 'single digit month' do
      mock_API_call(johnlennon)
      wiki_api.callAPI('John_Lennon')
      expect(wiki_api.day_of_birth).to eq '1940|10|9|'
    end
    it 'month and day double digits' do
      mock_API_call(hugobergmann)
      wiki_api.callAPI('Hugo_Bergmann')
      expect(wiki_api.day_of_birth).to eq '1883|12|25'
    end
    it 'person still living' do
      mock_API_call(sethrogen)
      wiki_api.callAPI('John_Lennon')
      expect(wiki_api.day_of_birth).to eq '1982|4|15'
    end
  end

  context 'format_birthday' do
    it 'if birthday is 10 characters, formats appropriately' do
      mock_API_call(johnlennon)
      wiki_api.callAPI('John_Lennon')
      wiki_api.day_of_birth
      expect(wiki_api.format_birthday).to eq '1940|10|9'
    end
  end

  context 'day_of_death' do
    it 'returns the day of the celebries death' do
      mock_API_call(johnlennon)
      wiki_api.callAPI('John_Lennon')
      expect(wiki_api.day_of_death).to eq '1980|12|8|'
    end
  end
end
