class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true
  validates :user, presence: true

  belongs_to :user
end
