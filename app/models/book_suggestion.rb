class BookSuggestion < ApplicationRecord
  belongs_to :user
  validates :author, :title, :link, :publisher, :year, presence: true
end
