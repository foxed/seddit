require 'rails_helper'

RSpec.describe Post, :type => :model do
  it "is associated with a user" do
    user = User.create(username: "Bob", email: "blah@blah.com", password: "foo", id: 2)
    post = Post.create(title: "Hey", content: "Yolo Foo Barr", user: user)

    expect(post.user.id).to eq(user.id)
  end
end
