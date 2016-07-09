class RenameTitleColumnToPosts < ActiveRecord::Migration
  def change
    rename_column :posts, :title, :user_id
  end
end
