class BooksController < ApplicationController
  include Wor::Paginate

  def index
    @books = Book.all
    # render_paginated Book

    respond_to do |format|
      format.json { render json: @books }
    end
  end

  def show
    @book = Book.find(params[:id])

    respond_to do |format|
      format.json { render json: @book }
    end
  end
end
