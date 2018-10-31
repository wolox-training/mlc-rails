class RentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @rents = Rent.all
    render_paginated @rents
  end

  def create
    rent = Rent.new(rent_params)
    render json: rent, status: :created
  end

  private

  def rent_params
    params.require(:rent).permit(:user_id, :book_id, :start_date, :end_date)
  end
end
