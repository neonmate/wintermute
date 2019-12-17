describe User do

  describe '#validate' do
    it { is_expected.to validate_presence_of(:uid) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:nickname) }
    it { is_expected.to validate_uniqueness_of(:uid) }
  end

  describe '#to_s' do
    it 'returns the nickname of the user' do
      user = build(:user, nickname: 'some_nickname')

      expect(user.to_s).to eq('some_nickname')
    end
  end

end
