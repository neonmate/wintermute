describe Conversation do

  describe '#validate' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:body) }

    it { is_expected.to belong_to(:user) }
  end

  describe '#default_order' do
    it 'returns the conversations ordered by creation time descending' do
      conversation_2 = Timecop.freeze(Time.now) { create(:conversation) }
      conversation_1 = Timecop.freeze(Time.now + 1.day) { create(:conversation) }
      conversation_3 = Timecop.freeze(Time.now - 1.day) { create(:conversation) }

      expect(described_class.default_order.pluck(:id)).to eq(
        [
          conversation_1.id,
          conversation_2.id,
          conversation_3.id,
        ]
      )
    end
  end

  describe '#destroy' do
    it 'destroys all dependent messages' do
      conversation = create(:conversation)
      message = create(:message, conversation: conversation)
      other_message = create(:message)

      expect { conversation.destroy! }.to change { Message.count }.from(2).to(1)
      expect(Message.exists?(message.id)).to be(false)
      expect(Message.exists?(other_message.id)).to be(true)
    end
  end

end
