# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
require 'sidekiq/web'

Rails.application.routes.draw do  
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
  
  root to: 'home#index'
  resources :users, only: [:show, :index]
  resources :dashboard, only: [:index]
  
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

  resources :jobs do
    collection do
      get '/my_jobs', to: 'jobs#my_jobs', as: :user
    end
  end
  resources :companies do
    collection do
      get '/my_companies', to: 'companies#my_companies', as: :user
    end
  end

  get 'my_companies' => 'companies#my_companies'
  get 'my_jobs' => 'jobs#my_jobs'
  get '/dashboard' => 'dashboard#index'
  get '/dashboard/companies' => 'dashboard#companies'

end
