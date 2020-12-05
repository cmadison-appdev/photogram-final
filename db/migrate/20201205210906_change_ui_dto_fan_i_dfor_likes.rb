class ChangeUiDtoFanIDforLikes < ActiveRecord::Migration[6.0]
  def change
    rename_column :likes, :user_id, :fan_id
  end
end
