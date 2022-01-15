class AddCommentToBookmarks < ActiveRecord::Migration[6.1]
  def change
    add_column :bookmarks, :comment, :string
  end
end
