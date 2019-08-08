describe Conversation::TextFilter do

  describe '#filter' do

    let(:scope) { Conversation.all }

    it 'filters conversations by title' do
      conversation_1 = create(:conversation, title: 'AAA')
      conversation_2 = create(:conversation, title: 'BBB')

      expect(subject.filter(scope, '')).to contain_exactly(conversation_1, conversation_2)
      expect(subject.filter(scope, 'AAA')).to contain_exactly(conversation_1)
    end

    it 'filters conversations by body' do
      conversation_1 = create(:conversation, body: 'AAA')
      conversation_2 = create(:conversation, body: 'BBB')

      expect(subject.filter(scope, '')).to contain_exactly(conversation_1, conversation_2)
      expect(subject.filter(scope, 'AAA')).to contain_exactly(conversation_1)
    end

    it 'filters conversations by messages' do
      conversation_1 = create(:conversation)
      create(:message, conversation: conversation_1, body: 'AAA')
      conversation_2 = create(:conversation)
      create(:message, conversation: conversation_2, body: 'BBB')

      expect(subject.filter(scope, '')).to contain_exactly(conversation_1, conversation_2)
      expect(subject.filter(scope, 'AAA')).to contain_exactly(conversation_1)
    end

  end

end
