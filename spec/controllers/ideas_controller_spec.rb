describe IdeasController do

  it { is_expected.to check_power(crud: :ideas, as: :idea_scope) }

  describe 'GET index' do
    it 'orders the ideas with the default order' do
      expect(Idea).to receive(:default_order).once.and_call_original

      get :index
    end
  end

end
