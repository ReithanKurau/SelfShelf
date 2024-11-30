class ShelfInterest < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  
  validates :interest, uniqueness: { scope: :user }
  validates :title, presence: true
  validates :creator, presence: true
  validates :publishing_year, presence: true
  validates :genre, presence: true
  validates :media_type, presence: true
  MEDIA_TYPE = ["book", "movie", "album"]
  validates :media_type, inclusion: { in: MEDIA_TYPE }

  has_one_attached :photo
  
  include PgSearch::Model
  pg_search_scope :search_by_title_creator_genre_description,
  against: [ :title, :creator, :genre, :description ],
  using: {
    tsearch: { prefix: true }
  }



end
