require 'wiki_api'
require 'helpers'

johnlennon = JSON.parse(File.read('./json_examples/john_lennon.json'))
hugobergmann = JSON.parse(File.read('./json_examples/hugo_bergmann.json'))
sethrogen = JSON.parse(File.read('./json_examples/seth_rogen.json'))

describe WikiAPI do
  wiki_api = WikiAPI.new

  context 'call_api' do
    it 'stubs API call and returns an empty hash' do
      mock_api_call(johnlennon)
      expect(wiki_api.call_api('John_Lennon')).to eq johnlennon
    end
  end

  context 'day_of_birth' do
    it 'single digit month' do
      mock_api_call(johnlennon)
      wiki_api.call_api('John_Lennon')
      expect(wiki_api.day_of_birth).to eq '1940|10|9|'
    end
    it 'month and day double digits' do
      mock_api_call(hugobergmann)
      wiki_api.call_api('Hugo_Bergmann')
      expect(wiki_api.day_of_birth).to eq '1883|12|25'
    end
    it 'person still living' do
      mock_api_call(sethrogen)
      wiki_api.call_api('John_Lennon')
      expect(wiki_api.day_of_birth).to eq '1982|4|15'
    end
  end

  context 'format_birthday' do
    it 'if birthday is 10 characters, formats appropriately' do
      mock_api_call(johnlennon)
      wiki_api.call_api('John_Lennon')
      wiki_api.day_of_birth
      expect(wiki_api.format_birthday).to eq '1940|10|9'
    end
  end

  context 'day_of_death' do
    it 'returns the day of the celebries death' do
      mock_api_call(johnlennon)
      wiki_api.call_api('John_Lennon')
      expect(wiki_api.day_of_death).to eq '1980|12|8|'
    end
    it 'returns nil if no death_day' do
      mock_api_call(sethrogen)
      wiki_api.call_api('Seth_Rogen')
      expect(wiki_api.day_of_death).to eq nil
    end
  end

  context 'format_deathday' do
    it 'removes trailing | if it exists' do
      mock_api_call(johnlennon)
      wiki_api.call_api('John_Lennon')
      wiki_api.day_of_death
      expect(wiki_api.format_deathday).to eq '1980|12|8'
    end
  end

  context 'spouce_list' do
    it 'returns single spouce' do
      mock_api_call(sethrogen)
      wiki_api.call_api('John_Lennon')
      expect(wiki_api.spouce_list).to eq ['Lauren Miller']
    end
    it 'returns list of multiple spouces' do
      mock_api_call(johnlennon)
      wiki_api.call_api('John_Lennon')
      expect(wiki_api.spouce_list).to eq ['Cynthia Lennon', 'Yoko Ono']
    end
  end
end
