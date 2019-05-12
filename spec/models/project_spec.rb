describe Project do

  describe '#validate' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:subtitle) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:repository_url) }
    it { is_expected.to allow_value('https://github.com/github/example').for(:repository_url) }
    it { is_expected.not_to allow_value('https://github.com/github').for(:repository_url) }
    it { is_expected.not_to allow_value('https://google.de').for(:repository_url) }
    it { is_expected.to validate_uniqueness_of(:repository_url) }

    it 'validates the repository stats against a schema' do
      project = build(:project)

      expect(project).to be_valid

      project.repository_stats = {}
      expect(project).to_not be_valid
      expect(project.errors[:repository_stats]).to match(
        [
          start_with("The property '#/' did not contain a required property of 'description' in schema"),
          start_with("The property '#/' did not contain a required property of 'created_at' in schema"),
          start_with("The property '#/' did not contain a required property of 'homepage_url' in schema"),
          start_with("The property '#/' did not contain a required property of 'total_stars' in schema"),
          start_with("The property '#/' did not contain a required property of 'total_watchers' in schema"),
          start_with("The property '#/' did not contain a required property of 'total_issues' in schema"),
          start_with("The property '#/' did not contain a required property of 'languages' in schema"),
          start_with("The property '#/' did not contain a required property of 'last_commits' in schema"),
          start_with("The property '#/' did not contain a required property of 'licence' in schema"),
          start_with("The property '#/' did not contain a required property of 'last_synchronized_at' in schema"),
        ]
      )

      project.repository_stats = {
        'description' => 'Some text',
        'created_at' => Time.parse('2001-01-01'),
        'homepage_url' => 'https://example.com',
        'total_stars' => 20,
        'total_watchers' => 40,
        'total_issues' => 60,
        'languages' => ['HTML', 'Ruby'],
        'last_commits' => [Time.parse('2001-01-01'), Time.parse('2001-01-02'), Time.parse('2001-01-03')],
        'licence' => 'MIT',
        'last_synchronized_at' => Time.parse('2001-01-01'),
      }
      expect(project).to be_valid

      project.repository_stats = {
        'description' => 1,
        'created_at' => 'wrong',
        'homepage_url' => 1,
        'total_stars' => 'wrong',
        'total_watchers' => 'wrong',
        'total_issues' => 'wrong',
        'languages' => [1],
        'last_commits' => ['wrong'],
        'licence' => 1,
        'last_synchronized_at' => 'wrong',
      }
      expect(project).not_to be_valid
      expect(project.errors[:repository_stats]).to match(
        [
          start_with("The property '#/description' of type integer did not match one or more of the following types: string, null in schema"),
          start_with("The property '#/created_at' must be a valid RFC3339 date/time string in schema"),
          start_with("The property '#/homepage_url' of type integer did not match one or more of the following types: string, null in schema"),
          start_with("The property '#/total_stars' of type string did not match one or more of the following types: number, null in schema"),
          start_with("The property '#/total_watchers' of type string did not match one or more of the following types: number, null in schema"),
          start_with("The property '#/total_issues' of type string did not match one or more of the following types: number, null in schema"),
          start_with("The property '#/languages/0' of type integer did not match the following type: string in schema"),
          start_with("The property '#/last_commits/0' must be a valid RFC3339 date/time string in schema"),
          start_with("The property '#/licence' of type integer did not match one or more of the following types: string, null in schema"),
          start_with("The property '#/last_synchronized_at' must be a valid RFC3339 date/time string in schema"),
        ]
      )
    end
  end

  it { is_expected.to belong_to(:user) }

  describe '#repository stats' do
    it 'has an empty default configuration' do
      project = build(:project)

      expect(project.repository_stats).to eq(
        'description' => nil,
        'created_at' => nil,
        'homepage_url' => nil,
        'total_stars' => nil,
        'total_watchers' => nil,
        'total_issues' => nil,
        'languages' => [],
        'last_commits' => [],
        'licence' => nil,
        'last_synchronized_at' => nil,
      )
    end
  end

end
