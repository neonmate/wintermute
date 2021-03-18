describe Power::DoesUserSubscriptions do

  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let!(:own_subscription) { create(:user_subscription, user: user) }
  let!(:foreign_subscription) { create(:user_subscription, user: other_user) }

  describe '#user_subscriptions' do
    it 'allows access to own subscriptions' do
      power = Power.new(user)

      expect(power.user_subscriptions).to contain_exactly(own_subscription)
    end
  end

end
