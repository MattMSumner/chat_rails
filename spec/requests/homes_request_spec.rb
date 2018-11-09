require 'rails_helper'

describe "HomesController", type: :request do
  it "redirects when someone isn't authenticated" do
    get('/')
    expect(response).to redirect_to('/auth/google_oauth2')
  end

  it "renders if there is a user" do
    sign_in

    get('/')
    expect(response.status).to eq(200)
  end

  def sign_in
    user = User.create!(auth_hash: "123", name: "some name")
    allow_any_instance_of(ApplicationController).
      to receive(:current_user).and_return(user)
  end
end
