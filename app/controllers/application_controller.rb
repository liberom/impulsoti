class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def logged_user_email
    if user_signed_in?
      session[:user_email] = current_user.email
      session[:user_email]
    end
  end

end
