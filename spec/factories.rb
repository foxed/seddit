include Warden::Test::Helpers

FactoryGirl.define do
  factory :user do
    username 'Bob'
    email 'blah@blah.com'
    password 'password'

    factory :admin do
      admin true
    end
  end

  factory :post do
    title 'Hey'
    content 'Contentttttt'
    user
  end

end
