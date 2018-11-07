class RentsController < ApplicationController
  before_action :authenticate_user!

  def index
    render_paginated Rent.all
  end

  def create
    rent = Rent.new(rent_params)
    if rent.save
      MailWorker.perform_async
      UserMailer.new_rent(rent.id).deliver_later
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
