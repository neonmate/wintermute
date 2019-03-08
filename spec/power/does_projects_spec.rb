describe Power do

  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let!(:own_project) { create(:project, user: user) }
  let!(:foreign_project) { create(:project, user: other_user) }

  subject(:power) { Power.new(user) }

  describe 'projects' do
    it 'allows access to all projects' do
      expect(power.projects).to contain_exactly(own_project, foreign_project)
    end
  end

  describe 'updatable_projects' do
    it 'allows access to own projects, but not to foreign projects' do
      expect(power.updatable_projects).to contain_exactly(own_project)
    end
  end

  describe 'creatable_projects' do
    it 'allows access to own projects, but not to foreign projects' do
      expect(power.creatable_projects).to contain_exactly(own_project)
    end
  end

  describe 'destroyable_projects' do
    it 'allows access to own projects, but not to foreign projects' do
      expect(power.destroyable_projects).to contain_exactly(own_project)
    end
  end

end
