describe Message::TextFilter do

  describe '#filter' do

    let(:scope) { Message.all }

    it 'filters messages by body' do
      message_1 = create(:message, body: 'AAA')
      message_2 = create(:message, body: 'BBB')

      expect(subject.filter(scope, '')).to contain_exactly(message_1, message_2)
      expect(subject.filter(scope, 'AAA')).to contain_exactly(message_1)
    end

  end

end
