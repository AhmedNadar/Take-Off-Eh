# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
require 'sidekiq/web'

Rails.application.routes.draw do
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
  
  root to: 'home#index'
  
  devise_for :users
  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
  end
  
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end
  
end
