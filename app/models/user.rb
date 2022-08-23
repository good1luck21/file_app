class User < ApplicationRecord
  has_secure_password
  has_one_attached :avatar
  has_many :posts
  has_many :likes

  def likes?(post)
    Like.where(post_id: post.id, user_id: self.id).any?
  end
end
