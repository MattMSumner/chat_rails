require 'rails_helper'

describe "HomesController", type: :request do
  it "redirects when someone isn't authenticated" do
    get('/')
    expect(response).to redirect_to('/auth/google_oauth2')
  end

  it "renders if there is a user" do
    user = User.create!(auth_hash: "123", name: "some name")
    ApplicationController.any_instance.stub(:current_user).and_return(user)

    get('/')
    expect(response.status).to eq(200)
  end
end
