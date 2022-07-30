Rails.application.routes.draw do
  authenticated :user, ->(user) { user.moderator? || user.admin? || user.user? } do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  end
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
  get 'moderator/show_pcomment/:id', to: "moderator#show_pcomment", as: 'moderator_pcomment'
  get 'users/profile'
  get 'moderator/new_poster'
  end
  resources :posters do
      resources :pcomments
  end
  
  root 'pages#home'
  resources :projects do
    resources :tasks
    resources :attachers
    end

  get 'user/:id', to: 'users#profile', as: 'user'


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
