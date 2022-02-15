class AddUniqueIndexToMovies < ActiveRecord::Migration[6.1]
  def change
    add_index :movies, [:title, :overview], unique: true
  end
end
