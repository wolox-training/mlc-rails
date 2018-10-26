Rails.application.routes.draw do
  # devise_for :users
  namespace :api, defaults: { format: 'json' } do
    # api_version(module: 'API/V1', path: {value: 'api/v1'}) do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
    end
  end
end
