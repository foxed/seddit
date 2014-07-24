include Warden::Test::Helpers

FactoryGirl.define do
  factory :user do
    username 'Bob'
    email 'blah@blah.com'
    password 'password'
  end

  def login
    user = FactoryGirl.create(:user)
    login_as user, scope: user
    user
  end
end
