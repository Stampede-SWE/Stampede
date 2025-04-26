class RenameUserIdInListings < ActiveRecord::Migration[8.0]
  def change
    remove_index :listings, name: "index_listings_on_User_id"
    rename_column :listings, :User_id, :user_id
    add_index :listings, :user_id
  end
end
