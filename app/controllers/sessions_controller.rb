class SessionsController < ApplicationController
  def create
    @user = User.create_with(name: name).find_or_create_by(auth_hash: auth_hash.uid)
    self.current_user = @user
    redirect_to root_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

  def name
    request.env['omniauth.auth'].info.name
  end
end
