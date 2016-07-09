class ChangeDatatypeCategoryOfPosts < ActiveRecord::Migration
  def change
    change_column :posts, :category, :integer
  end
end
