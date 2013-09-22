class OauthController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    p '&' * 1000
    p user
    if user.save
      p '*' * 1000
      sign_in user
      flash[:success] = "Successfully logged in with Facebook"
      redirect_to root_path
    else
      p user.errors
      fail
    end
  end

  def fail
    flash[:error] = "There was an error. Please try again."
    redirect_to root_url
  end
end
