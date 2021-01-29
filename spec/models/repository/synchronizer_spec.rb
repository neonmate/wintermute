describe Repository::Synchronizer do

  let(:frozen_time) { Time.parse('2001-01-01') }

  around { |example| Timecop.freeze(frozen_time, &example) }

  describe '.run' do
    it 'synchronizes the repository stats for all active repositories', vcr: { cassette_name: 'repository_synchronizer/multiple_repositories' } do
      repository_1 = create(:repository, owner: 'github', name: 'graphql-client')
      repository_2 = create(:repository, owner: 'github', name: 'rubocop-github')

      described_class.run

      expect(repository_1.reload.total_stars).to eq(741)
      expect(repository_2.reload.total_stars).to eq(438)
    end

    it 'does not synchronize archived repositories', vcr: { cassette_name: 'repository_synchronizer/archived_repositories' } do
      repository_1 = create(:repository, owner: 'github', name: 'graphql-client')
      repository_2 = create(:repository, :archived, owner: 'github', name: 'rubocop-github')

      described_class.run

      expect(repository_1.reload.last_synchronized_at).to be_a(Time)
      expect(repository_2.reload.last_synchronized_at).to eq(nil)
    end
  end

  describe '#synchronize_repository' do
    it 'synchronizes the repository stats of a repository', vcr: { cassette_name: 'repository_synchronizer/single_repository' } do
      repository = create(:repository, owner: 'github', name: 'graphql-client')

      described_class.new(repository).synchronize_repository

      expect(repository).to have_attributes(
        description: 'A Ruby library for declaring, composing and executing GraphQL queries',
        homepage_url: '',
        total_stars: 741,
        total_watchers: 51,
        total_issues: 96,
        languages: ['Ruby', 'HTML'],
        first_commit_at: Time.parse('2016-08-03 20:51:26 +0200'),
        last_commit_at: Time.parse('2019-05-29 20:59:47 +0200'),
        last_commits_at: [
          Time.parse('2019-05-29 20:59:47 +0200'),
          Time.parse('2019-05-29 20:24:24 +0200'),
          Time.parse('2019-05-29 19:26:22 +0200'),
          Time.parse('2019-05-29 18:58:34 +0200'),
          Time.parse('2019-05-29 01:36:11 +0200'),
          Time.parse('2019-05-29 00:56:27 +0200'),
          Time.parse('2019-05-15 21:38:45 +0200'),
          Time.parse('2019-05-15 10:02:37 +0200'),
          Time.parse('2019-05-15 09:33:48 +0200'),
          Time.parse('2019-05-15 05:43:06 +0200'),
          Time.parse('2019-05-15 05:39:42 +0200'),
          Time.parse('2019-05-14 02:05:54 +0200'),
          Time.parse('2019-05-14 02:05:51 +0200'),
          Time.parse('2019-05-14 01:41:21 +0200'),
          Time.parse('2019-05-14 01:21:01 +0200'),
          Time.parse('2019-05-14 01:14:22 +0200'),
          Time.parse('2019-05-13 23:59:21 +0200'),
          Time.parse('2019-05-13 23:58:03 +0200'),
          Time.parse('2019-05-13 23:56:16 +0200'),
          Time.parse('2019-05-13 23:49:16 +0200'),
          Time.parse('2019-05-13 23:47:43 +0200'),
          Time.parse('2019-05-13 23:36:19 +0200'),
          Time.parse('2019-04-25 17:46:42 +0200'),
          Time.parse('2019-04-25 02:24:19 +0200'),
          Time.parse('2019-04-24 10:53:11 +0200'),
        ],
        licence: 'MIT License',
        last_synchronized_at: frozen_time,
      )
    end
  end
end
