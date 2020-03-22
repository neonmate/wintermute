class UserMailer < ApplicationMailer

  def subscriber_notification(subscription, message)
    @topic = %(#{subscription.subscribable.class.model_name.to_s.downcase} "#{subscription.subscribable}")
    @message = message

    mail(
      to: subscription.user.email,
      subject: "@#{@message.user.nickname} replied to the subscribed #{@topic}",
    )
  end

end
