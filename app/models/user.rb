class User < ApplicationRecord
  include DeviseTokenAuth::Concerns::User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  before_create :skip_confirmation!
  before_validation :set_uid
  validates :first_name, :last_name, presence: true

  def set_uid
    self.uid = self.class.generate_uid if uid.blank?
  end

  def self.generate_uid
    loop do
      token = Devise.friendly_token
      break token unless to_adapter.find_first(uid: token)
    end
  end
end
