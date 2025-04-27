class AddNicknameToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :displayname, :string
  end
end
