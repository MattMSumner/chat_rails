require 'rails_helper'

describe "HomesController", type: :request do
  it "redirects to google when someone isn't authenticated" do
    get('/')
    expect(response).to redirect_to('/auth/google_oauth2')
  end

  it "redirects to chatrooms if there is a user" do
    sign_in

    get('/')
    expect(response).to redirect_to('/chatrooms')
  end

  def sign_in
    user = User.create!(auth_hash: "123", name: "some name")
    allow_any_instance_of(ApplicationController).
      to receive(:current_user).and_return(user)
  end
end
