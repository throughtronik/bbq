class ChangePhotosTableAddNullFalseToFields < ActiveRecord::Migration[6.1]
  def change
    change_column_null :photos, :user_id, false
    change_column_null :photos, :event_id, false
  end
end
