class BooksController < ApplicationController
  def index
    @books = Book.all
    render_paginated @books
  end

  def show
    @book = Book.find(params[:id])
    render json: @book
  end
end
