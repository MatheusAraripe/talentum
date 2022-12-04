class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
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
end
