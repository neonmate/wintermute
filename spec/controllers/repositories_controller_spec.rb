describe RepositoriesController do

  it { is_expected.to check_power(crud: :repositories, as: :repository_scope) }

  describe 'GET index' do

    it 'orders the repositories with the default order' do
      expect(Repository).to receive(:default_order).once.and_call_original

      get :index
    end

    # Pagination is tested with "Showing page 1 of 1" in the integration tests

    # Filter is tested in the integration tests
  end

end
