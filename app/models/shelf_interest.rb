class ShelfInterest < ApplicationRecord
  belongs_to :user
  belongs_to :interest
  has_many :comments, dependent: :destroy
  validates :interest, uniqueness: { scope: :user }
  has_one_attached :photo
  has_rich_text :rich_journal

  include PgSearch::Model
  pg_search_scope :search_by_title_creator_genre_description,
  against: [ :title, :creator, :genre, :description ],
  using: {
    tsearch: { prefix: true }
  }



end
