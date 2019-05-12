user = User.create!(
  nickname: 'github',
  uid: '12345',
  email: 'github@example.com'
)

Project.create!(
  user: user,
  title: 'Some title',
  subtitle: 'Some subtitle',
  description: 'Some description',
  repository_url: 'https://github.com/github/example',
  repository_stats: {
    description: 'Some description',
    created_at: Time.now,
    homepage_url: 'https://example.com',
    total_stars: 10,
    total_watchers: 5,
    total_issues: 100,
    languages: ['HTML', 'Ruby'],
    last_commits: [Time.now, Time.now - 1.day, Time.now - 1.days, Time.now - 3.months],
    licence: '"MIT LicenseMIT License',
    last_synchronized_at: Time.now,
  }
)
