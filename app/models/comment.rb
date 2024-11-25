class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :shelf_interest
  validates :content, presence: true
end
