describe Power::DoesMessages do

  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let!(:own_message) { create(:message, user: user) }
  let!(:foreign_message) { create(:message, user: other_user) }

  describe 'updatable_messages' do
    it 'allows access to own messages, but not to foreign messages' do
      power = Power.new(user)

      expect(power.updatable_messages).to contain_exactly(own_message)
    end

    it 'restricts access to all users that are not signed in' do
      power = Power.new(nil)

      expect(power.updatable_messages).to eq(nil)
    end
  end

  describe 'creatable_messages' do
    it 'allows access to own messages, but not to foreign messages' do
      power = Power.new(user)

      expect(power.creatable_messages).to contain_exactly(own_message)
    end

    it 'restricts access to all users that are not signed in' do
      power = Power.new(nil)

      expect(power.creatable_messages).to eq(nil)
    end
  end

  describe 'destroyable_messages' do
    it 'allows access to own messages, but not to foreign messages' do
      power = Power.new(user)

      expect(power.destroyable_messages).to contain_exactly(own_message)
    end

    it 'restricts access to all users that are not signed in' do
      power = Power.new(nil)

      expect(power.destroyable_messages).to eq(nil)
    end
  end

end
