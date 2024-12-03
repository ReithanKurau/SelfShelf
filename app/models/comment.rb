class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :shelf_interest
  validates :content, presence: true, length: { maximum: 90 }
end
