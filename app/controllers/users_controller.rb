class UsersController < ApplicationController
  before_action :autenticate_user, unless: :verify_api
end
