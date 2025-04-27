class User < ApplicationRecord
    has_many :listings
    has_secure_password
    has_many :sent_messages, class_name: "Message", foreign_key: "sender_id", dependent: :destroy
    has_many :received_messages, class_name: "Message", foreign_key: "recipient_id", dependent: :destroy
    before_validation :normalize_phone_number
    validates :displayname, presence: true, length: { minimum: 3, message: "must be 3 characters long" }
    validates :username, presence: true, length: { minimum: 5, message: "must be 5 characters long" }, format: { with: /\A[a-zA-Z0-9]+\z/, message: "only letters and numbers are allowed" }, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }, on: :create
    validates :password, presence: true, length: { minimum: 6 }, confirmation: { message: "Password confirmation doesn't match" }, on: :resetpassword, if: :password_changed?
    validates :password_confirmation, presence: true, on: :resetpassword, if: :password_changed?
    validates :phone, presence: true, format: { with: /\A\d{10}\z/, message: "number must be 10 digits long" }
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email" }, allow_blank: true

    def normalize_phone_number
        if phone.present?
            self.phone = phone.gsub(/\D/, "")
        end
    end

    def password_changed?
        password.present? && password != self.password_salt
    end
end
