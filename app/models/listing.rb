class Listing < ApplicationRecord
  has_one_attached :image


  belongs_to :user

  # Validations to ensure no field is left blank
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 } # Ensure price is a positive number
  validates :location, presence: true
  validates :category, presence: true
  validates :image, presence: true
end
