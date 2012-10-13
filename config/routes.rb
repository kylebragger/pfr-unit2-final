Shouter::Application.routes.draw do
  
  resources :users
  
  resources :shouts
  
  post 'follow', to: 'follows#create', as: :follow
  delete 'unfollow', to: 'follows#destroy', as: :unfollow
  
  root to: 'pages#home'

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id))(.:format)'
end
