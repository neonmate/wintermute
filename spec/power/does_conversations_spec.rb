describe Power do

  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let!(:own_conversation) { create(:conversation, user: user) }
  let!(:foreign_conversation) { create(:conversation, user: other_user) }

  describe 'conversations' do
    it 'allows access to all conversations' do
      power = described_class.new(user)

      expect(power.conversations).to contain_exactly(own_conversation, foreign_conversation)
    end
  end

  describe 'updatable_conversations' do
    it 'allows access to own conversations, but not to foreign conversations' do
      power = described_class.new(user)

      expect(power.updatable_conversations).to contain_exactly(own_conversation)
    end

    it 'restricts access to all users that are not signed in' do
      power = described_class.new(nil)

      expect(power.updatable_conversations).to eq(nil)
    end
  end

  describe 'creatable_conversations' do
    it 'allows access to own conversations, but not to foreign conversations' do
      power = described_class.new(user)

      expect(power.creatable_conversations).to contain_exactly(own_conversation)
    end

    it 'restricts access to all users that are not signed in' do
      power = described_class.new(nil)

      expect(power.creatable_conversations).to eq(nil)
    end
  end

  describe 'destroyable_conversations' do
    it 'allows access to own conversations, but not to foreign conversations' do
      power = described_class.new(user)

      expect(power.destroyable_conversations).to contain_exactly(own_conversation)
    end

    it 'restricts access to all users that are not signed in' do
      power = described_class.new(nil)

      expect(power.destroyable_conversations).to eq(nil)
    end
  end

end
