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

  def static_map_url
    "http://maps.googleapis.com/maps/api/staticmap?size=400x400&markers=color:black|#{self.latitude},#{self.longitude}"
  end

end
