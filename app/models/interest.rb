class Interest < ApplicationRecord
  has_many :users, through: :shelf_interests
  has_many :shelf_interests
  validates :title, presence: true
  # validates :creator
  validates :publishing_year, presence: true
  # validates :genre
  validates :media_type, presence: true
  MEDIA_TYPE = ["book", "movie", "album"]
  validates :media_type, inclusion: { in: MEDIA_TYPE }
  has_many :comments, through: :shelf_interests
  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_by_title_creator_genre_description,
  against: [ :title, :creator, :genre, :description ],
  using: {
    tsearch: { prefix: true }
  }

end
