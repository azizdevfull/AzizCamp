Rails.application.routes.draw do
  get 'users/profile'
  
  resources :posters do
    resources :comments
    resources :pcomments
  end
  
  root 'pages#home'
  resources :projects do
    resources :tasks
    resources :attachers
    end

  get 'u/:id', to: 'users#profile', as: 'user'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users do
    member do
      get :confirm_email
    end
  end
end
