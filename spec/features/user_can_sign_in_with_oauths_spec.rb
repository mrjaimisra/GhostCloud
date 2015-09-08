require 'rails_helper'

RSpec.feature "User can sign in with OAuth", type: :feature do
  scenario "successfully" do
    visit signin_path

  end
end
