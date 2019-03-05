require 'app_interface'

describe AppInterface do
  let(:interface) { described_class.new }

  context 'introduce' do
    it 'introduces user and gives instructions' do
      allow(interface).to receive(:gets).and_return("celebrity")
      allow(interface).to receive(:system).and_return('n/a')
      expect(interface).to receive(:puts).with("Welcome, please enter the name of the celebrity you would like to search!", "Accepted search format: \"Firstname Lastname\" (e.g., John Lennon)")
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
      expect(interface).to receive(:puts).with("\e[0;31;49mYour searched celebrity details are as follows:\e[0m", "\e[0;31;49mBirth date: \e[0mbirthdate", "\e[0;31;49mDeath date: \e[0mdeathdate", "\e[0;31;49mSpouse(s): \e[0mspouse_list", "\e[0;31;49mArticle Summary: \e[0marticle_summary")
      interface.print_data
    end
  end
end
