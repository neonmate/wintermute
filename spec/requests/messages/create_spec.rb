describe '/messages', type: :request do

  let(:current_user) { create(:user, nickname: 'thomas') }

  before { sign_in current_user }

  it 'creates a notification email for all subscribers of an idea' do
    user_1 = create(:user)
    create(:user)
    user_3 = create(:user)

    idea = create(:idea, title: 'Some title', user: current_user)
    idea.user_subscriptions.create!(user: user_1)
    idea.user_subscriptions.create!(user: user_3)

    post '/messages', params: { message: { parent_id: idea.id, parent_type: 'Idea', body: 'New message' } }

    expect(ActionMailer::Base.deliveries.count).to eq(2)
    expect(ActionMailer::Base.deliveries.flat_map(&:to)).to contain_exactly(user_1.email, user_3.email)
    expect(ActionMailer::Base.deliveries.first.subject).to eq('@thomas replied to the subscribed idea "Some title"')
  end

  it 'creates a notification email for all subscribers of a repository' do
    user_1 = create(:user)
    create(:user)
    user_3 = create(:user)

    repository = create(:repository, owner: 'ms', name: 'repo_1', user: current_user)
    repository.user_subscriptions.create!(user: user_1)
    repository.user_subscriptions.create!(user: user_3)

    post '/messages', params: { message: { parent_id: repository.id, parent_type: 'Repository', body: 'New message' } }

    expect(ActionMailer::Base.deliveries.count).to eq(2)
    expect(ActionMailer::Base.deliveries.flat_map(&:to)).to contain_exactly(user_1.email, user_3.email)
    expect(ActionMailer::Base.deliveries.first.subject).to eq('@thomas replied to the subscribed repository "ms/repo_1"')
  end

end
