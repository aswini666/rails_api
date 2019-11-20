Rails.application.routes.draw do
  devise_for :users
  namespace :api do
  	namespace :v1 do
  		devise_scope :user do
  			post "sign_up", to: "registrations#create"
  			post "sign_in", to: "sessions#create"
  		end
  		resources :users
  		resources :tags
  	end
  end
end
