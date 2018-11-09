class RentsController < ApiController
  before_action :authenticate_user!
  before_action :set_locale

  def index
    render_paginated Rent.all
  end

  def create
    rent = Rent.new(rent_params)
    if rent.save
      UserMailer.new_rent(rent.id).deliver_now
      render json: rent, status: :created
    else
      render json: rent.errors, status: :unprocessable_entity
    end
  end

  private

  def rent_params
    params.require(:rent).permit(:user_id, :book_id, :start_date, :end_date)
  end
end
