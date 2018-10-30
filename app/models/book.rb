class Book < ApplicationRecord
  validates :genre, :author, :cover_image, :title, :publisher, :year, presence: true
end
