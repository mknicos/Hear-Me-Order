class Item < ActiveRecord::Base
  belongs_to :restaurant
  #This belongs to restaurant gives me
  #restaurant
  #restaurant=
  #build_restaurant
  #create_restaurant
  #create_restaurant!
  

  #has_many_ingredients
  #has_many_questions

  validates :name,
    presence: true,
    format: { with: /\A[a-zA-Z\s]+\z/,
      message: "The item name can only have letters or spaces"}

  validates :price,
    presence: true

  validates_numericality_of :price, greater_than: 0,
    message: "The price must be a number greater than 0"

end
