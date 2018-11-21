class UserMailer < ApplicationMailer
  def new_rent(rent_id)
    rent_details(rent_id)
    mail to: @user.email, subject: t('rent_email.new_rent_subject')
  end

  def end_of_rent(rent_id)
    rent_details(rent_id)
    mail to: @user.email, subject: t('rent_email.end_of_rent_subject')
  end

  private

  def rent_details(rent_id)
    @rent = Rent.find(rent_id)
    @book = @rent.book
    @user = @rent.user
  end
end
