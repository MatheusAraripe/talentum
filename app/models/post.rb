class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_one_attached :photo

  validates :title, :category_id, :photo, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_title_and_description_and_user,
    against: [ :title, :description ],
    associated_against: {
      user: [:nickname]
    },
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
