class ErrorsController < ApplicationController

  skip_power_check

  before_action :basic_authentication

  TestException = Class.new(StandardError)

  def new
    raise TestException, 'Test exception. All is well.'
  end

  private

  def basic_authentication
    authenticate_or_request_with_http_basic do |user, password|
      user == 'basic' && password == Rails.application.secrets.errors_controller_basic_password
    end
  end

end
