class HomesController < ApplicationController
  def show
    @current_user = current_user

    if @current_user.nil?
      redirect_to '/auth/google_oauth2'
    end
  end
end
