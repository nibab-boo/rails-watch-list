class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates :comment, length: { minimum: 6 }
  validates_presence_of :movie, :list
  validates :movie, uniqueness: { scope: :list }
  # check for unique combination of movie and list
end
