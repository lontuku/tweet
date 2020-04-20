class User < ApplicationRecord
  require 'bcrypt'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :likes, :dependent => :destroy
  has_many :tweets, :dependent => :destroy
  has_many :follows, :dependent => :destroy
#through: :likes, 
  validates :name, presence: true
  def valid_password?(password)
    if BCrypt::Password.new(encrypted_password) == password
      return true
    else
      return false
    end
  end
end
