require 'rails_helper'

feature 'Admin deletes post' do
  scenario 'successfully' do
    post = create(:post)
    admin = post.user
    login_as admin
    visit post_path(post)
    click_link 'Delete Post'

    expect(page).not_to have_content 'Hey'
  end

  scenario 'unsuccessfully' do
    post = create(:post)
    visit post_path(post)

    expect(page).to have_content "You need to sign in or sign up before continuing."
  end
end

