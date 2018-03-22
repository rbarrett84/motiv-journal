Rails.application.routes.draw do
  root 'entries#index'
  devise_for :users

  resources :entries

  namespace :api do
    namespace :v1 do
      resources :entries, only: [:new] 
    end
  end
end
