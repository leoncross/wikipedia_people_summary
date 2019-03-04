require 'wiki_api'

johnlennon = JSON.parse(File.read("./json_examples/john_lennon.json"))


describe WikiAPI do
  wiki_api = WikiAPI.new

  context 'callAPI' do
    it 'stubs API call and returns an empty hash' do
      expect(wiki_api.callAPI('John_Lennon')).to eq johnlennon
    end
  end

  context 'birthday' do
    it 'extracts birthday data from api call' do
      wiki_api.callAPI('John_Lennon')
      expect(wiki_api.day_of_birth).to eq '1940|10|9'
    end
  end
end
