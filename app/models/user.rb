class User < ApplicationRecord

    has_many :listings, foreign_key: "user_id"

    has_secure_password
    has_many :sent_messages, class_name: "Message", foreign_key: "sender_id", dependent: :destroy
    has_many :received_messages, class_name: "Message", foreign_key: "recipient_id", dependent: :destroy
    before_validation :normalize_phone_number
    validates :phone, presence: true, format: { with: /\A\d{10}\z/, message: "number must be 10 digits long" }

    def normalize_phone_number
        if phone.present?
            self.phone = phone.gsub(/\D/, "")
        end
    end
end
