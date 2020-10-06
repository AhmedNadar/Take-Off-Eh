# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
require 'sidekiq/web'

Rails.application.routes.draw do  
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
  
  root to: 'home#index'
  resources :users, only: [:show, :index]
  resources :companies
  resources :dashboard, only: [:index]
  resources :jobs
  
  devise_for :users,  path: 'profile', 
                      path_names: { sign_out: 'logout', edit: 'settings' },
                      controllers: {
                        registrations: 'registrations'}
                    
  devise_scope :user do
    get '/register', to: 'devise/registrations#new'
    get '/login', to: 'devise/sessions#new'
    get 'profile/edit', to: 'devise/registrations#edit'
    get 'profile/cancel', to: 'devise/registrations#cancel'
  end
  
  get 'mycompanies'     => 'companies#my_companies'
  get '/dashboard' => 'dashboard#index'

end
