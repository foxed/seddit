require 'rails_helper'

describe Post, :type => :model do
  context 'with valid input' do
    it 'has valid credentials' do
      user = User.create(username: "Bob", id: 1)
      post = Post.create(title: "Hey", content: "YO", user: user)
      expect(post).to be_valid
    end
  end

  context 'with invalid inputs' do
    it 'is not associated with a user' do
      post = Post.create(title: "Hey", content: "YO")
      expect(post).to be_invalid
    end

    it 'does not have a title' do
      user = User.create(username: "Bob", id: 2)
      post = Post.create(content: "Yo", user: user)
      expect(post).to be_invalid
    end

    it 'does not content' do
      user = User.create(username: "Bob", id: 2)
      post = Post.create(title: "Hey", user: user)
      expect(post).to be_invalid
    end
  end
end
