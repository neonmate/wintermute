class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :make_action_mailer_use_request_host_and_protocol

  private

  def make_action_mailer_use_request_host_and_protocol
    ActionMailer::Base.default_url_options[:protocol] = request.protocol
    ActionMailer::Base.default_url_options[:host] = request.host_with_port
  end
end
