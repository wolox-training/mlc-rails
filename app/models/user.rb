class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
  validates :first_name, :last_name, :locale, presence: true
  has_many :rents, dependent: :destroy
  has_many :book_suggestions, dependent: :destroy
end
