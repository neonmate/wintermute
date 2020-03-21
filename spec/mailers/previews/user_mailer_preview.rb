class UserMailerPreview < ActionMailer::Preview

  def subscriber_notification
    idea = Idea.new(title: 'Some idea')
    user_from = User.new(nickname: 'thomas')
    message = Message.new(user: user_from, body: 'Some message', parent: idea)

    user_to = User.new(email: 'user@example.com')
    subscription = User::Subscription.new(user: user_to, subscribable: idea)

    UserMailer.subscriber_notification(subscription, message)
  end

end
