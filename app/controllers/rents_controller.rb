class RentsController < ApplicationController
  before_action :authenticate_user!

  def index
    render_paginated Rent.all
  end

  def create
    rent = Rent.new(rent_params)
    if rent.save
      render json: rent, status: :created
      # HardWorker.perform_async(rent_params.start_date, rent_params.end_date)
      MailWorker.perform_async('2018-08-09', '2018-08-12')
      UserMailer.welcome_email(rent_params).deliver_now
    else
      render json: rent.errors, status: :unprocessable_entity
    end
  end

  private

  def rent_params
    params.require(:rent).permit(:user_id, :book_id, :start_date, :end_date)
  end
end
