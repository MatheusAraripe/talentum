class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy

  has_one_attached :photo

  validates :title, :category_id, :photo, presence: true

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :title, :description ],
    associated_against: {
      user: [:nickname]
    },
    using: {
      tsearch: { prefix: true }
    }
end
