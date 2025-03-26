require 'sqlite3'
require 'active_record'

# Establish connection
ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'stampede.db'
)

# Define models
class User < ActiveRecord::Base
  has_many :listings
end

class Listing < ActiveRecord::Base
  belongs_to :user
end

# Create tables if they don't exist
ActiveRecord::Schema.define do
  unless ActiveRecord::Base.connection.table_exists?(:users)
    create_table :users do |t|
      t.string :name
      t.string :email
      t.timestamps
    end
  end

  unless ActiveRecord::Base.connection.table_exists?(:listings)
    create_table :listings do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end

# Insert sample data
user = User.create(name: "Alice", email: "alice@example.com")
Listing.create(title: "Textbooks", description: "Used CS textbooks", price: 30.00, user: user)

# Print sample data
puts "Users: #{User.all.map { |u| "#{u.name} (#{u.email})" }}"
puts "Listings: #{Listing.all.map { |l| "#{l.title} - $#{l.price} by #{l.user.name}" }}"
