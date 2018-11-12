class ApiController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Wor::Paginate

  def set_locale
    I18n.locale = current_user.locale
  end
end
