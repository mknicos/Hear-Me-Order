class Restaurant < ActiveRecord::Base
  has_many :employees

  validates :phone,
    uniqueness: true,
    presence: true

  validates :address,
    uniqueness: true,
    presence: true

  validates :name,
    presence: true,
    format: { with: /\A[a-zA-Z\s\']+\z/,
      message: "The Restuarant Name can only have letters or spaces"}

  geocoded_by :address
  after_validation :geocode
end
