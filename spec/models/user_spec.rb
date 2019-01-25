describe User do

  describe '#validate' do
    it { is_expected.to validate_presence_of(:uid) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:nickname) }
    it { is_expected.to validate_uniqueness_of(:uid) }
  end

end
