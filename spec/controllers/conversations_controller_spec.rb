describe ConversationsController do

  it { is_expected.to check_power(crud: :conversations, as: :conversation_scope) }

  describe 'GET index' do
    it 'orders the conversations with the default order' do
      expect(Conversation).to receive(:default_order).once.and_call_original

      get :index
    end
  end

end
