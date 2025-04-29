class Listing < ApplicationRecord
  belongs_to :user

  # Validations to ensure no field is left blank
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 } # Ensure price is a positive number
  validates :location, presence: true
  validates :category, presence: true
  has_many :messages, dependent: :nullify
end
