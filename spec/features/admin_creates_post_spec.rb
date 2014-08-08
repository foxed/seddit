require 'rails_helper'

feature "Admin creates post" do
  before do
    login
    visit new_post_path
  end

  scenario "with valid credentials" do
    within "form" do
      fill_in "Title", :with => "Hey"
      fill_in "Content", :with => "Nice post."
      click_button "Create Post"
    end
    expect(page).to have_content "Your post has been saved!"
  end

  scenario "post has title field" do
    expect(page).to have_content "Title"
  end

  scenario "post has content field" do
    expect(page).to have_content "Content"
  end
end

feature "Unauthorized person visits new post path" do
  scenario "as a Guest" do
    visit new_post_path
    expect(page).to have_content "You need to sign in or sign up before continuing."
  end

  scenario "as a non-admin User" do
    visit new_post_path
    expect(page).to have_content "You must be an admin to create a most."
  end
end

def login
  user = create :admin
  login_as user, scope: :user
  user
end
