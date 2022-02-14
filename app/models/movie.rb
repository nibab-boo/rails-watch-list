class Movie < ApplicationRecord
  has_many :bookmarks
  validates_uniqueness_of :title, :overview
  validates_presence_of :title, :poster_url, :rating

  before_destroy :should_not_destroy

  def should_not_destroy
    if bookmarks.count > 1
      throw :abort
    end
  end
end
