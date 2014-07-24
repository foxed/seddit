require 'rails_helper'

RSpec.describe PostsController, :type => :controller do
  describe "POST #create" do
    it "creates a new post" do
      user = User.create(username: "Bob", id: 1)
      post = Post.create(title:"New", content: "Info", user: user)

      expect(Post.last).to eq(post)
    end

    it "redirects to posts_path" do
      expect(response).to redirect_to(posts_path)
    end
  end
end
