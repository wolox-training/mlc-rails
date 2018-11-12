class UserMailer < ApplicationMailer
  def new_rent(rent_id)
    @rent = Rent.find(rent_id)
    @book = @rent.book
    @user = @rent.user
    mail to: @user.email, subject: t('rent_email.new_rent_subject')
  end
end
