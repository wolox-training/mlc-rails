class ApiController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Wor::Paginate
  include Pundit
  protect_from_forgery

  def set_locale
    I18n.locale = current_user.locale
  end

  def pundit_user
    current_user
  end
end
