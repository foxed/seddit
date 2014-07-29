require 'rails_helper'

feature "User signs in" do
  scenario 'with valid email and password' do
    user = create(:user)
    user_signs_in(user.email, user.password)

    expect(page).to have_content 'Sign in'
  end

  def user_signs_in(email, password)
    visit root_path
    click_link 'Sign In'
    within 'form' do
      fill_in 'Email', with: email
      fill_in 'Password', with: password
    end
    click_button 'Sign in'
  end

  def form
    "form"
  end
end

