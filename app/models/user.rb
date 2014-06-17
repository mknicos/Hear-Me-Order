class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, uniqueness: true

  validates_presence_of :email, :first_name, :last_name

  validates :first_name,
    presence: true,
    format: { with: /\A[a-zA-Z]+\z/,
      message: "Your first name can only have letters"}

  validates :last_name,
    presence: true,
    format: { with: /\A[a-zA-Z]+\z/,
      message: "Your last name can only have letters"}

end
