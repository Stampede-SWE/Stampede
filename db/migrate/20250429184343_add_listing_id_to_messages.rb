class AddListingIdToMessages < ActiveRecord::Migration[8.0]
  def change
    add_column :messages, :listing_id, :integer
    add_foreign_key :messages, :listings, column: :listing_id
    add_index :messages, :listing_id
    change_column_null :messages, :listing_id, true
  end
end
