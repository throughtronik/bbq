class ChangePhotosTableAddForeignKeys < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :photos, :users
    add_foreign_key :photos, :events
  end
end
