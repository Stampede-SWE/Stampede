class AddLocation < ActiveRecord::Migration[8.0]
  def change
    add_column :listings, :location, :string
  end
end
