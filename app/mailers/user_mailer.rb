class UserMailer < ApplicationMailer
  def welcome_email(_user)
    mail(to: 'micaela.cole@wolox.com.ar', subject: 'Welcome to WBooks!')
  end

  def new_rent(rent)
    user = User.find(rent.user_id)
    mail to: user.email, subject: 'New rent created'
  end
end
