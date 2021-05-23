class ChangeDataTypeForComments < ActiveRecord::Migration[6.1]
  def change
    change_column(:comments, :user_id, :integer, options: { null: true, foreign_key: true} )
  end
end
