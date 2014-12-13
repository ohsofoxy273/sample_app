require 'spec_helper'

feature "user visits the 'new' page" do
  background {visit signup_path}

  scenario "home page has the correct content" do
    expect(page).to have_content("Sign up")
  end
end
