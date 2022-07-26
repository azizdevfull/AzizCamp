Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  authenticated :user, ->(user) { user.moderator? } do
  get 'moderator', to: 'moderator#index'
  get 'moderator/projects'
  get 'moderator/attachers'
  get 'moderator/tasks'
  get 'moderator/posters'
  get 'moderator/pcomments'
  get 'moderator/users'
  get 'moderator/roject'
  get 'moderator/show_poster/:id', to: "moderator#show_poster", as: 'moderator_poster'
  get 'users/profile'
  end
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


  # authenticated :user, ->(user) { user.admin? } do
  # end
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
