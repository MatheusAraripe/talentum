class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one_attached :photo

  validates :title, :category_id, :photo, presence: true
end
