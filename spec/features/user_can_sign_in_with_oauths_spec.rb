require 'rails_helper'
require 'webmock'

RSpec.feature "User can sign in with OAuth", type: :feature do
  xscenario "successfully" do
    visit root_path
    click_on "Login"

    expect(current_path).to eq(soundcloud_connect_path)
  end
end
