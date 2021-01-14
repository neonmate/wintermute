class ApplicationController < ActionController::Base

  include SessionHelper
  include Consul::Controller

  protect_from_forgery with: :exception
  require_power_check

  current_power do
    Power.new(current_user)
  end

  rescue_from Consul::Powerless do
    if current_user.present?
      raise # re-raise
    else
      redirect_to root_path, flash: { error: 'You need to be signed in to access this page' }
    end
  end

  def success_flash(record)
    flash[:success] = "#{record.model_name.human} successfully saved"
  end

  def error_flash(record)
    flash.now[:error] = "#{record.model_name.human} could not be saved"
  end

  def destroy_flash(record)
    flash[:success] = "#{record.model_name.human} deleted"
  end

end
