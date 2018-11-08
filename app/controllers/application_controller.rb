class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Wor::Paginate
  protect_from_forgery

  def set_locale
    I18n.locale = current_user.locale
  end
end
