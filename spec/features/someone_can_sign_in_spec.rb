require 'rails_helper'

describe "user flow", js: true do
  it "someone can authenticate with google and create a chat room" do
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
      provider: 'google',
      uid: '123545',
      info: { name: "some name"}
    })

    visit "/"

    expect(page).to have_content("some name")

    click_link "Create new room"

    fill_in :chatroom_topic, with: "Some cool topic"

    click_button('Create Room')

    expect(page).to have_content("Some cool topic")

    fill_in :message_content, with: "hi all"

    click_button('Post')

    expect(page).to have_content("hi all")
  end
end
