class AddNameAndDescriptionAndImageUrlToAuthors < ActiveRecord::Migration
  def change
    add_column :authors, :name, :string
    add_column :authors, :description, :string
    add_column :authors, :image_url, :string
  end
end
