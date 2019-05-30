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

  end

end
