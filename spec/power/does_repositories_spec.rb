describe Power do

  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let!(:own_repository) { create(:repository, user: user) }
  let!(:foreign_repository) { create(:repository, user: other_user) }


  describe 'repositories' do
    it 'allows access to all repositories' do
      power = described_class.new(user)

      expect(power.repositories).to contain_exactly(own_repository, foreign_repository)
    end
  end

  describe 'updatable_repositories' do
    it 'allows access to own repositories, but not to foreign repositories' do
      power = described_class.new(user)

      expect(power.updatable_repositories).to contain_exactly(own_repository)
    end

    it 'restricts access to all users that are not signed in' do
      power = described_class.new(nil)

      expect(power.updatable_repositories).to eq(nil)
    end
  end

  describe 'creatable_repositories' do
    it 'allows access to own repositories, but not to foreign repositories' do
      power = described_class.new(user)

      expect(power.creatable_repositories).to contain_exactly(own_repository)
    end

    it 'restricts access to all users that are not signed in' do
      power = described_class.new(nil)

      expect(power.creatable_repositories).to eq(nil)
    end
  end

  describe 'destroyable_repositories' do
    it 'allows access to own repositories, but not to foreign repositories' do
      power = described_class.new(user)

      expect(power.destroyable_repositories).to contain_exactly(own_repository)
    end

    it 'restricts access to all users that are not signed in' do
      power = described_class.new(nil)

      expect(power.destroyable_repositories).to eq(nil)
    end
  end

end
