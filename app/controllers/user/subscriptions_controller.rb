class User
  class SubscriptionsController < ApplicationController

    power :user_subscriptions, as: :subscription_scope

    def create
      build_subscription
      @subscription.save!
      success_flash(@subscription)

      redirect_to @subscription.subscribable
    end

    def destroy
      load_subscription
      @subscription.destroy!
      destroy_flash(@subscription)

      redirect_to @subscription.subscribable
    end

    private

    def load_subscription
      @subscription ||= subscription_scope.find(params[:id])
    end

    def build_subscription
      @subscription ||= subscription_scope.new
      @subscription.attributes = subscription_params
    end

    def subscription_params
      subscription_params = params[:user_subscription]
      return {} if subscription_params.blank?

      subscription_params.permit(:subscribable_id, :subscribable_type)
    end

  end
end
