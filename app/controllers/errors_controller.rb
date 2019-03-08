class ErrorsController < ApplicationController

  skip_power_check

  TestException = Class.new(StandardError)

  def new
    raise TestException, 'Test exception. All is well.'
  end

end
