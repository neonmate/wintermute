describe Message do

  describe '#validate' do
    it { is_expected.to validate_presence_of(:body) }

    it { is_expected.to belong_to(:conversation) }
    it { is_expected.to belong_to(:user) }
  end

end
