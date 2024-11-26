class ShelfInterest < ApplicationRecord
  belongs_to :interest
  belongs_to :user
  validates :interest, uniqueness: { scope: :user }
  has_one_attached :photo
end
