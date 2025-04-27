class User < ApplicationRecord
    has_many :listings, foreign_key: "User_id"
    has_secure_password
end
