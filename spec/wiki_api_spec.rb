require 'wiki_api'
johnlennon = JSON.parse(File.read("./spec/example_data.json"))


describe WikiAPI do
  wiki_api = WikiAPI.new

  context 'callAPI' do
    it 'stubs API call and returns an empty hash' do
      expect(wiki_api.callAPI('John_Lennon')).to eq johnlennon

    end
  end
end
