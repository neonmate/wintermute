class Message
  class Form < ActiveType::Record[Message]
    after_commit :notify_subscribers, on: :create

    private

    def notify_subscribers
      parent.user_subscriptions.find_each do |user_subscription|
        UserMailer.subscriber_notification(user_subscription, self).deliver_now
      end
    end

  end
end
