class Post < ApplicationRecord
  has_one_attached :image
  has_many_attached :images

  has_many :likes
  belongs_to :user
end
