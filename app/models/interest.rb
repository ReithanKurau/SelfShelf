class Interest < ApplicationRecord
  has_many :users, through: :shelf_interests
  has_many :shelf_interests
  validates :title, presence: true
  validates :creator, presence: true
  validates :publishing_year, presence: true
  validates :genre, presence: true
  validates :media_type, presence: true
  has_one_attached :photo
  MEDIA_TYPE = ["Book", "Movie", "Album"]
  validates :media_type, inclusion: { in: MEDIA_TYPE }

  include PgSearch::Model
  pg_search_scope :search_by_title_creator_genre,
  against: [ :title, :description, :location ],
  using: {
    tsearch: { prefix: true }
  }

end
