describe Project::Synchronizer do

  let(:frozen_time) { Time.parse('2001-01-01') }

  around { |example| Timecop.freeze(frozen_time, &example) }

  describe '.run' do
    it 'synchronizes the repository stats for all projects', vcr: { cassette_name: 'graphql_client_and_rubocop_request' } do
      project_1 = create(:project, repository_url: 'https://github.com/github/graphql-client')
      project_2 = create(:project, repository_url: 'https://github.com/github/rubocop-github')

      Project::Synchronizer.run

      expect(project_1.reload.repository_stats['total_stars']).to eq(728)
      expect(project_2.reload.repository_stats['total_stars']).to eq(430)
    end
  end

  describe '#synchronize_repository' do
    it 'synchronizes the repository stats of a project', vcr: { cassette_name: 'graphql_client_request' } do
      project = create(:project, repository_url: 'https://github.com/github/graphql-client')

      Project::Synchronizer.new(project).synchronize_repository

      expect(project.repository_stats).to include(
        {
          'description' => 'A Ruby library for declaring, composing and executing GraphQL queries',
          'created_at' => '2016-08-03T18:51:26Z',
          'homepage_url' => '',
          'total_stars' => 728,
          'total_watchers' => 50,
          'total_issues' => 96,
          'languages' => ['Ruby', 'HTML'],
          'last_commits' =>
            [
              '2019-02-28T15:35:03Z',
              '2019-02-13T00:55:11Z',
              '2019-02-13T00:50:22Z',
              '2019-02-13T00:48:41Z',
              '2019-02-13T00:47:33Z',
              '2018-12-14T13:50:41Z',
              '2018-12-13T22:02:06Z',
              '2018-12-13T21:11:27Z',
              '2018-12-13T20:33:04Z',
              '2018-12-13T15:35:09Z',
              '2018-12-13T14:55:39Z',
              '2018-10-25T18:50:38Z',
              '2018-10-25T18:45:32Z',
              '2018-10-15T20:47:59Z',
              '2018-10-15T19:49:10Z',
              '2018-10-15T19:36:53Z',
              '2018-10-15T19:01:52Z',
              '2018-08-20T20:02:42Z',
              '2018-08-13T17:20:02Z',
              '2018-08-12T01:19:53Z',
              '2018-08-12T00:17:04Z',
              '2018-07-16T21:18:13Z',
              '2018-07-16T21:17:54Z',
              '2018-07-16T21:16:35Z',
              '2018-07-16T21:13:05Z',
            ],
          'licence' => 'MIT License',
          'last_synchronized_at' => frozen_time,
        }
      )
    end
  end
end
