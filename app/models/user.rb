class User < ApplicationRecord
    has_many :Listing
    has_secure_password
    before_validation :normalize_phone_number
    validates :phone, presence: true, format: { with: /\A\d{10}\z/, message: "number must be 10 digits long" }

    def normalize_phone_number
        if phone.present?
            self.phone = phone.gsub(/\D/, '')
        end
    end
end
