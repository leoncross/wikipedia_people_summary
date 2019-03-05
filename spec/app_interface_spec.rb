require 'app_interface'

describe AppInterface do
  let(:interface) { described_class.new }

  context 'clean_search_result' do
    it 'introduces user' do
      allow(interface).to receive(:gets).and_return("celebrity")
      allow(interface).to receive(:puts)
      expect(interface.introduce).to eq "celebrity"
    end
  end
end
