class BooksController < ApiController
  def index
    render_paginated Book.all
  end

  def show
    render json: Book.find(params[:id])
  end
end
