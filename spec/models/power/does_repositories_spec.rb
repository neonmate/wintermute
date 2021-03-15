describe Power do

  let(:user) { create(:user) }
  let(:admin) { create(:user, :admin) }
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
    it 'allows access to all repositories as admin' do
      power = described_class.new(admin)

      expect(power.updatable_repositories).to contain_exactly(own_repository, foreign_repository)
    end

    it 'restricts access to all users that are no admin' do
      power = described_class.new(user)

      expect(power.updatable_repositories).to eq(nil)
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
    it 'allows access to all repositories as admin' do
      power = described_class.new(admin)

      expect(power.destroyable_repositories).to contain_exactly(own_repository, foreign_repository)
    end

    it 'restricts access to all users that are no admin' do
      power = described_class.new(user)

      expect(power.destroyable_repositories).to eq(nil)
    end

    it 'restricts access to all users that are not signed in' do
      power = described_class.new(nil)

      expect(power.destroyable_repositories).to eq(nil)
    end
  end

  describe '#permitted_repository_attributes' do
    it 'allows all attributes as admin' do
      power = described_class.new(admin)

      expect(power.permitted_repository_attributes).to contain_exactly(
        :repository_url,
        :preview_image,
        :preview_image_cache,
        :state_event,
        :delivery_model,
        :categories,
      )
    end

    it 'allows only the repository url for users that are no admin' do
      power = described_class.new(user)

      expect(power.permitted_repository_attributes).to contain_exactly(:repository_url)
    end

  end

end
