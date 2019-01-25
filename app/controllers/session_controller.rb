class SessionController < ApplicationController

  def new
    # This route is catched by the Omniauth Middleware and is invisible to rake routes
    redirect_to '/auth/github'
  end

  def create
    user = User::Authenticable.authenticate(authorize_params)
    session[:uid] = user.uid
    flash[:success] = "Successfully signed in as #{user.nickname} (#{user.email})"
    redirect_to root_path
  end

  def destroy
    session.delete(:uid)
    flash[:success] = 'Successfully signed out'
    redirect_to root_path
  end

  private

  def authorize_params
    request.env.fetch('omniauth.auth')
  end

end
