class TestsController < ApplicationController

  skip_power_check

  def test_flash
    redirect_to root_path, flash: { success: 'This is a test flash' }
  end

  def colors
  end

  def test_unauthorized
    raise Consul::Powerless
  end

end
