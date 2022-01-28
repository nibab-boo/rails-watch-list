class AddUserToLists < ActiveRecord::Migration[6.1]
  def change
    add_reference :lists, :user, null: false, foreign_key: true
  end
end
