class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  has_one_attached :photo
  validates :name, presence: true, uniqueness: true

  def non_existence_movies
    Movie.all - movies
  end
end
