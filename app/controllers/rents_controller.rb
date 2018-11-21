class RentsController < ApiController
  before_action :authenticate_user!
  before_action :set_locale

  def index
    rents = Rent.all
    authorize rents
    render_paginated rents
  end

  def create
    rent = Rent.new(rent_params)
    authorize rent
    if rent.save
      UserMailer.new_rent(rent.id).deliver_later
      render json: rent, status: :created
    else
      render json: rent.errors, status: :unprocessable_entity
    end
  end

  # def end_of_rent
  #   if rent.end_date
  #     UserMailer.end_of_rent(rent.id).deliver_now
  #   end
  # end

  private

  def rent_params
    params.require(:rent).permit(:user_id, :book_id, :start_date, :end_date)
  end
end
