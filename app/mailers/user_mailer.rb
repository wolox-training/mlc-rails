class UserMailer < ApplicationMailer
  def new_rent(rent_id)
    @rent = Rent.find(rent_id)
    mail to: @rent.user.email, subject: 'New rent information'
  end
end
