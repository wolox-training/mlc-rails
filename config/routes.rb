Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
	require 'sidekiq/web'
	mount Sidekiq::Web => '/sidekiq'
	
	mount_devise_token_auth_for 'User', at: 'auth'
	resources :books, only: [:index, :show]
	resources :rents, only: [:index, :create]
	resources :book_suggestions, only: [:create]

	get 'open_library_book/:isbn', to: 'books#open_library_book', as: :open_library_book
end
