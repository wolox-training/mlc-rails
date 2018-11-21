class BookSuggestion < ApplicationRecord
  belongs_to :user, optional: true
  validates :author, :title, :link, :publisher, :year, presence: true
end
