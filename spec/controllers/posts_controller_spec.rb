require 'rails_helper'

RSpec.describe PostsController, :type => :controller do
  describe "POST #create" do
    it "successfully creates a new post" do
      user = User.create(username: "Bob", id: 1)
      post = Post.create(title:"New", content: "Info", user: user)

      expect(Post.last).to eq(post)
    end

    it "does not create a new post" do
      post :create, post: { title: "title" }

      expect(response).to be_true
    end

    it "redirects to posts_path" do
      sign_in create(:user)
      post :create, post: { title: "title", content: "content"}
      expect(response).to redirect_to posts_path
    end
  end
end
