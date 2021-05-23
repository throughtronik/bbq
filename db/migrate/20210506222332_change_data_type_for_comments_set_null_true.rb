class ChangeDataTypeForCommentsSetNullTrue < ActiveRecord::Migration[6.1]
  def change
    change_column(:comments, :user_id, :integer, default: nil, null: true)
  end
end
