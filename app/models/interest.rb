class Interest < ApplicationRecord
  has_many :users, through: :shelf_interests
  has_many :shelf_interests
  validates :title, presence: true
  validates :creator, presence: true
  validates :publishing_year, presence: true
  validates :genre, presence: true
  validates :media_type, presence: true
  has_one_attached :photo
end
