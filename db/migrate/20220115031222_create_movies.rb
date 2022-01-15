class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :poste_url
      t.integer :poster

      t.timestamps
    end
  end
end
