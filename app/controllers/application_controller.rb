class ApplicationController < ActionController::Base
  def current_user=(user)
    session[:current_user_id] = user.auth_hash
  end

  def current_user
    @_current_user ||= User.find_by(auth_hash: session[:current_user_id])
  end
end
