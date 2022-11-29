class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :title, :category_id, presence: true
end
