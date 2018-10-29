class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  protect_from_forgery with: :exception, if: :verify_api

  def verify_api
    params[:controller].split('/')[0] != 'devise_token_auth'
  end

end
