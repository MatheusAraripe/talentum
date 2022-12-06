class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  acts_as_voter
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :category
  has_many :posts
  has_one_attached :photo
  has_many :comments, dependent: :destroy

  validates :nickname, format: {
    with: /^[A-Za-z0-9_.]+$/,
    multiline: true,
    message: "Use only letters and number separated by _ or ." }

  validates :first_name, :last_name, :nickname, presence: true

  # Follows relation
  has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :following_relationships, foreign_key: :follower_id, class_name: 'Follow'
  has_many :following, through: :following_relationships, source: :following

  # Methods to have a simpler way of following and unfollowing users and to check if a user is following another
  def follow(user_id)
    following_relationships.create(following_id: user_id)
  end

  def unfollow(user_id)
    following_relationships.find_by(following_id: user_id).destroy
  end

  def is_following?(user_id)
    relationship = Follow.find_by(follower_id: id, following_id: user_id)
    return true if relationship
  end
end
