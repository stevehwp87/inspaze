class Designer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  # validates :display_email, format: { with: /\A[^@]+@[^@]+\z/,
  #   message: "Please enter valid email address" }, absence: true
  #   validates :display_email,absence: true
  # validates :phone_no, format: { with: /\d/,
  #   message: "Please enter valid phone no" }, length: { in: 5..15 ,
  #   message: "Please enter valid phone no"}, absence: true
 

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :albums, dependent: :destroy
end
