require 'rails_helper'

describe "authentication" do
  it "someone can authenticate with google" do
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
      provider: 'google',
      uid: '123545',
      info: { name: "some name"}
    })

    visit "/"

    expect(page).to have_content("some name")
  end
end
