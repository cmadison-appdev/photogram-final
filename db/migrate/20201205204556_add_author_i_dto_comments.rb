class AddAuthorIDtoComments < ActiveRecord::Migration[6.0]
  def change
    rename_column :comments, :commenter_id, :author_id
  end
end
