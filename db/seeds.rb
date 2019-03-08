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
  application_url: 'https://example.com'
)
