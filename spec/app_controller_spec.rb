require 'app_controller'

describe AppController do
  let(:mock_wiki_api) { double :mock_wiki_api }
  let(:mock_app_interface) { double :mock_app_interface }
  let(:controller) { described_class.new(mock_wiki_api, mock_app_interface) }

  context 'clean_search_result' do
    it 'turns any two words into correct format for Wiki search' do
      expect(controller.clean_search_result('leon cross')).to eq "Leon_Cross"
    end
  end
  context 'celebrity_search' do
    it 'runs through the programme' do
      expect(mock_app_interface).to receive(:introduce)
      expect(controller).to receive(:clean_search_result)
      expect(mock_wiki_api).to receive(:call_api)
      expect(mock_wiki_api).to receive(:day_of_birth)
      expect(mock_wiki_api).to receive(:format_birthday)
      expect(mock_wiki_api).to receive(:day_of_death)
      expect(mock_wiki_api).to receive(:format_deathday)
      expect(mock_wiki_api).to receive(:spouse_list)
      expect(mock_wiki_api).to receive(:summary)
      expect(mock_app_interface).to receive(:setup_variables)
      expect(mock_app_interface).to receive(:print_data)
      controller.celebrity_search_runner
    end
  end
end
