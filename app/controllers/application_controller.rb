class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :make_action_mailer_use_request_host_and_protocol

  def success_flash(record)
    flash[:success] = "#{record.model_name.human} successfully saved"
  end

  def error_flash(record)
    flash.now[:error] = "#{record.model_name.human} could not be saved"
  end

  def destroy_flash(record)
    flash[:success] = "#{record.model_name.human} deleted"
  end

  private

  def make_action_mailer_use_request_host_and_protocol
    ActionMailer::Base.default_url_options[:protocol] = request.protocol
    ActionMailer::Base.default_url_options[:host] = request.host_with_port
  end

end
