Shouter::Application.routes.draw do
  
  resources :users, except: [:new, :show]
  get 'signup', to: 'users#new', as: :new_user
  get 'profile/:username', to: 'users#show', as: :user
  
  resources :shouts
  
  post 'follow', to: 'follows#create', as: :follow
  delete 'unfollow', to: 'follows#destroy', as: :unfollow
  
  get 'tags/:name', to: 'tags#show', as: :tag
  
  get 'login', to: 'sessions#new', as: :login
  delete 'logout', to: 'sessions#destroy', as: :logout
  post 'auth', to: 'sessions#create', as: :auth
  
  root to: 'pages#home'

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id))(.:format)'
end
