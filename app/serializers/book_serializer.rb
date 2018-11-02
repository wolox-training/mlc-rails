class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :genre, :publisher, :cover_image, :year
end
