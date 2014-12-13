require 'spec_helper'

@title = "| Ruby on Rails Tutorial Sample App"

feature "Home page" do
  background {visit root_path}

  scenario "home page has the correct content" do
    expect(page).to have_content("Welcome to the Sample App")
  end

  scenario "it has the correct title" do
    expect(page).to have_title "Home #{@title}"
  end

end

feature "Help page" do
  background {visit('/help')}

  scenario "home page has the correct content" do
    expect(page).to have_content("Help")
  end

  scenario "it has the correct title" do
    expect(page).to have_title "Help #{@title}"
  end
end

feature "About page" do
  background {visit('/about')}

  scenario "about page has the correct content" do
    expect(page).to have_content("About")
  end

  scenario "it has the correct title" do
    expect(page).to have_title "About #{@title}"
  end
end

feature "Contact page" do
  background {visit('/contact')}

  scenario "contact page has the correct content" do
    expect(page).to have_content("Contact the Ruby on Rails Tutorial")
  end
end

