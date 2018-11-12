class Book < ApplicationRecord
  validates :genre, :author, :cover_image, :title, :publisher, :year, presence: true
  has_many :rents, dependent: :destroy
end
