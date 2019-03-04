require 'app_controller'

describe AppController do
  let(:mock_wiki_api) { double :mock_wiki_api }
  let(:controller) { described_class.new(mock_wiki_api) }


  context 'clean_search_result' do
    it 'turns any two words into correct format for Wiki search' do
      expect(controller.clean_search_result('leon cross')).to eq "Leon_Cross"
    end
  end
end
