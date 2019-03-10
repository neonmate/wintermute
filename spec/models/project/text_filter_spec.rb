describe Project::TextFilter do

  describe '#filter' do

    let(:scope) { Project.all }

    it 'filters projects by title' do
      project_1 = create(:project, title: 'AAA')
      project_2 = create(:project, title: 'BBB')

      expect(subject.filter(scope, '')).to contain_exactly(project_1, project_2)
      expect(subject.filter(scope, 'AAA')).to contain_exactly(project_1)
    end

    it 'filters projects by subtitle' do
      project_1 = create(:project, subtitle: 'AAA')
      project_2 = create(:project, subtitle: 'BBB')

      expect(subject.filter(scope, '')).to contain_exactly(project_1, project_2)
      expect(subject.filter(scope, 'AAA')).to contain_exactly(project_1)
    end

  end

end
