class AddImageUrlToLists < ActiveRecord::Migration[6.1]
  def change
    add_column :lists, :image_url, :string
  end
end
