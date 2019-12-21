describe Repository::TextFilter do

  describe '#filter' do

    let(:scope) { Repository.all }

    it 'filters repositories by owner' do
      repository_1 = create(:repository, owner: 'AAA')
      repository_2 = create(:repository, owner: 'BBB')

      expect(subject.filter(scope, '')).to contain_exactly(repository_1, repository_2)
      expect(subject.filter(scope, 'AAA')).to contain_exactly(repository_1)
    end

    it 'filters repositories by name' do
      repository_1 = create(:repository, name: 'AAA')
      repository_2 = create(:repository, name: 'BBB')

      expect(subject.filter(scope, '')).to contain_exactly(repository_1, repository_2)
      expect(subject.filter(scope, 'AAA')).to contain_exactly(repository_1)
    end

    it 'filters repositories by description' do
      repository_1 = create(:repository, description: 'AAA')
      repository_2 = create(:repository, description: 'BBB')

      expect(subject.filter(scope, '')).to contain_exactly(repository_1, repository_2)
      expect(subject.filter(scope, 'AAA')).to contain_exactly(repository_1)
    end

    it 'filters repositories by messages' do
      repository_1 = create(:repository)
      create(:message, parent: repository_1, body: 'AAA')
      repository_2 = create(:repository)
      create(:message, parent: repository_2, body: 'BBB')

      expect(subject.filter(scope, '')).to contain_exactly(repository_1, repository_2)
      expect(subject.filter(scope, 'AAA')).to contain_exactly(repository_1)
    end

    it 'does not include messages of an other type' do
      repository = create(:repository)
      idea = create(:idea, id: repository.id)
      create(:message, parent_type: 'Idea', parent_id: repository.id, body: 'AAA')

      expect(subject.filter(scope, '')).to contain_exactly(repository)
      expect(subject.filter(scope, 'AAA')).to be_empty
    end

  end

end
