require 'app_interface'

describe AppInterface do
  let(:interface) { described_class.new }

  context 'introduce' do
    it 'introduces user and gives instructions' do
      allow(interface).to receive(:gets).and_return("celebrity")
      expect(interface).to receive(:puts).with("Welcome, please enter the name of the celebrity you would like to search!", "At any time, type 'exit' to exit out of the app", "Accepted search format: 'Firstname Lastname' (e.g., John Lennon)")
      expect(interface.introduce).to eq "celebrity"
    end
  end
  context 'setup_variables' do
    it 'assigns variable names' do
      interface.setup_variables('celebrity','birthdate', 'deathdate', 'spouse_list', 'article_summary')
      expect(interface.celebrity).to eq "celebrity"
      expect(interface.birthdate).to eq "birthdate"
      expect(interface.deathdate).to eq "deathdate"
      expect(interface.spouse_list).to eq "spouse_list"
      expect(interface.article_summary).to eq "article_summary"
    end
  end
  context 'print_data' do
    it 'prints the variables' do
      interface.setup_variables('celebrity','birthdate', 'deathdate', 'spouse_list', 'article_summary')
      expect(interface).to receive(:puts).with(
          "Your searched celebrity details are as follows:",
          "Birth date: birthdate",
          "Death date: deathdate",
          "Spouse: spouse_list",
          "Article Summary deathdate"
        )
      interface.print_data
    end
  end
end
