describe Idea::TextFilter do

  describe '#filter' do

    let(:scope) { Idea.all }

    it 'filters ideas by title' do
      idea_1 = create(:idea, title: 'AAA')
      idea_2 = create(:idea, title: 'BBB')

      expect(subject.filter(scope, '')).to contain_exactly(idea_1, idea_2)
      expect(subject.filter(scope, 'AAA')).to contain_exactly(idea_1)
    end

    it 'filters ideas by description' do
      idea_1 = create(:idea, description: 'AAA')
      idea_2 = create(:idea, description: 'BBB')

      expect(subject.filter(scope, '')).to contain_exactly(idea_1, idea_2)
      expect(subject.filter(scope, 'AAA')).to contain_exactly(idea_1)
    end

    it 'filters ideas by body' do
      idea_1 = create(:idea, body: 'AAA')
      idea_2 = create(:idea, body: 'BBB')

      expect(subject.filter(scope, '')).to contain_exactly(idea_1, idea_2)
      expect(subject.filter(scope, 'AAA')).to contain_exactly(idea_1)
    end

    it 'filters ideas by messages' do
      idea_1 = create(:idea)
      create(:message, parent: idea_1, body: 'AAA')
      idea_2 = create(:idea)
      create(:message, parent: idea_2, body: 'BBB')

      expect(subject.filter(scope, '')).to contain_exactly(idea_1, idea_2)
      expect(subject.filter(scope, 'AAA')).to contain_exactly(idea_1)
    end

    it 'does not include messages of an other type' do
      idea = create(:idea)
      create(:repository, id: idea.id)
      create(:message, parent_type: 'Repository', parent_id: idea.id, body: 'AAA')

      expect(subject.filter(scope, '')).to contain_exactly(idea)
      expect(subject.filter(scope, 'AAA')).to be_empty
    end

  end

end
