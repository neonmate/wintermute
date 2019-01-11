describe Project do

  describe '#validate' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:subtitle) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:repository_url) }
    it { is_expected.to allow_value('https://github.com/github/example').for(:repository_url) }
    it { is_expected.not_to allow_value('https://google.de').for(:repository_url) }
    it { is_expected.to allow_value('https://example.com').for(:application_url) }
    it { is_expected.not_to allow_value('example.com').for(:application_url) }
  end

  it 'does soft delete the records' do
    project = create(:project)

    expect { project.destroy! }.to change { Project.count }.from(1).to(0)
    expect(described_class.with_deleted).to contain_exactly(project)
  end

end
