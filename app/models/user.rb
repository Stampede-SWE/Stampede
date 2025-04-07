class User < ApplicationRecord
    has_many :Listing
    has_secure_password
end
