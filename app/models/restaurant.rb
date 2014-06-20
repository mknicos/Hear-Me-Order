class Restaurant < ActiveRecord::Base
  has_many :employees

  validates :phone, uniqueness: true

  validates :address, uniqueness: true

  validates :name,
    presence: true,
    format: { with: /\A[a-zA-Z\s\']+\z/,
      message: "The Restuarant Name can only have letters or spaces"}
end
