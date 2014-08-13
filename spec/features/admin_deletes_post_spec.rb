require 'rails_helper'

feature 'Admin deletes post' do
  scenario 'successfully' do
    login_as_admin
    visit post_path
  end

  scenario 'unsuccessfully' do

  end
end

def login_as_admin
  user = create :admin
  login_as user, scope: :user
  user
end
