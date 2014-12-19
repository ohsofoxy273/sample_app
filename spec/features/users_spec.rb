require 'spec_helper'

feature "user visits the 'new' page" do
  background {visit signup_path}

  scenario "home page has the correct content" do
    expect(page).to have_content("Sign up")
  end

  scenario "user fills in the new user form correctly" do
    fill_in("Name", with: "Alice")
    fill_in("Email", with: "alice@example.com")
    fill_in("Password", with: "password")
    fill_in("Confirmation", with: "password")   
    click_button("Create my account")
    expect(page).to have_content("Alice")
  end
end

feature "user visits the 'show' page" do

  scenario "home page has the correct content" do
    alice = Fabricate(:user)
    visit user_path(alice)
    expect(page).to have_title("#{alice.name}")
    expect(page).to have_content("#{alice.name}")
  end
end
