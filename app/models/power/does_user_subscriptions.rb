module Power::DoesUserSubscriptions
  as_trait do

    power :user_subscriptions do
      user.subscriptions
    end

  end
end
