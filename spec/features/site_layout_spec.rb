require 'spec_helper'

feature "Home page" do
  background { visit root_path } 
  
  scenario "home page has the correct home link" do
    expect(page).to have_link("Home", href: root_path )
  end
  
  scenario "home page has the correct help link" do
    expect(page).to have_link("Help", help_path )
  end

  scenario "home page has the correct contact link" do
    expect(page).to have_link("Contact", contact_path )
  end

  scenario "it has a proper header" do
    expect(page).to have_link("sample app") 
  end

  scenario "it has a proper footer" do
    expect(page).to have_link("News")
  end

end