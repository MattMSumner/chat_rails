class HomesController < ApplicationController
  def show
    if current_user.nil?
      redirect_to '/auth/google_oauth2'
    else
      redirect_to chatrooms_path
    end
  end
end
