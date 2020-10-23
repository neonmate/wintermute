describe Idea do

  describe '#validate' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:body) }

    it { is_expected.to belong_to(:user) }
  end

  describe '.default_order' do
    it 'returns the ideas ordered by creation time descending' do
      idea_2 = Timecop.freeze(Time.now) { create(:idea) }
      idea_1 = Timecop.freeze(Time.now + 1.day) { create(:idea) }
      idea_3 = Timecop.freeze(Time.now - 1.day) { create(:idea) }

      expect(described_class.default_order.pluck(:id)).to eq(
        [
          idea_1.id,
          idea_2.id,
          idea_3.id,
        ]
      )
    end
  end

  describe '#destroy' do
    it 'destroys all dependent messages' do
      idea = create(:idea)
      message = create(:message, parent: idea)
      other_message = create(:message)

      expect { idea.destroy! }.to change { Message.count }.from(2).to(1)
      expect(Message.exists?(message.id)).to be(false)
      expect(Message.exists?(other_message.id)).to be(true)
    end
  end

  describe '#messages_with_default_order' do
    it 'orders the messages by created at ascending' do
      idea = create(:idea)

      message_1 = create(:message, parent: idea, created_at: Time.now + 1.day)
      message_2 = create(:message, parent: idea, created_at: Time.now - 1.day)
      message_3 = create(:message, parent: idea, created_at: Time.now)

      expect(idea.messages_with_default_order.pluck(:id)).to eq(
        [
          message_2.id,
          message_3.id,
          message_1.id
        ]
      )
    end
  end

end
