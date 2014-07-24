require 'rails_helper'

feature "Admin creates post" do
  scenario "creating post" do
    visit '/posts/new'
    within post_form do
      fill_in "Title", :with => "Hey"
      fill_in "Content", :with => "Nice post."
      click_button "Create Post"
    end
    expect(page).to have_content "Your post has been saved!"
  end

  def post_form
    "form"
  end

  scenario "post has title field" do
    visit '/posts/new'
    expect(page).to have_content "Title"
  end

  scenario "post has content field" do
    visit '/posts/new'
    expect(page).to have_content "Content"
  end
end
