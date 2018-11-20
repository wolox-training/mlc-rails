class BooksController < ApiController
  # require 'OpenLibraryService'
  def index
    render_paginated Book.all
  end

  def show
    render json: Book.find(params[:id])
  end

  def external_api_get
    isbn = params[:isbn]
    render json: OpenLibraryService.new(isbn).book_info, status: :ok
  rescue StandardError => e
    render json: { errors: e.message }, status: :unprocessable_entity
  end
end
