describe Power::DoesIdeas do

  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let!(:own_idea) { create(:idea, user: user) }
  let!(:foreign_idea) { create(:idea, user: other_user) }

  describe 'ideas' do
    it 'allows access to all ideas' do
      power = Power.new(user)

      expect(power.ideas).to contain_exactly(own_idea, foreign_idea)
    end
  end

  describe 'updatable_ideas' do
    it 'allows access to own ideas, but not to foreign ideas' do
      power = Power.new(user)

      expect(power.updatable_ideas).to contain_exactly(own_idea)
    end

    it 'restricts access to all users that are not signed in' do
      power = Power.new(nil)

      expect(power.updatable_ideas).to eq(nil)
    end
  end

  describe 'creatable_ideas' do
    it 'allows access to own ideas, but not to foreign ideas' do
      power = Power.new(user)

      expect(power.creatable_ideas).to contain_exactly(own_idea)
    end

    it 'restricts access to all users that are not signed in' do
      power = Power.new(nil)

      expect(power.creatable_ideas).to eq(nil)
    end
  end

  describe 'destroyable_ideas' do
    it 'allows access to own ideas, but not to foreign ideas' do
      power = Power.new(user)

      expect(power.destroyable_ideas).to contain_exactly(own_idea)
    end

    it 'restricts access to all users that are not signed in' do
      power = Power.new(nil)

      expect(power.destroyable_ideas).to eq(nil)
    end
  end

end
