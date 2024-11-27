class User < ApplicationRecord
  has_many :shelf_interests
  has_many :interests, through: :shelf_interests
  has_one_attached :photo
  validates :username, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         #params to be added
end
