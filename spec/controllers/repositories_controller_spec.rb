describe RepositoriesController do

  it { is_expected.to check_power(crud: :repositories, as: :repository_scope) }

  describe 'GET index' do
    it 'orders the repositories with the default order' do
      expect(Repository).to receive(:default_order).once.and_call_original

      get :index
    end

    it 'does not include archived repositories' do
      repository = create(:repository)
      create(:repository, :archived)

      get :index
      expect(assigns(:repositories)).to contain_exactly(repository)
    end
  end

end
