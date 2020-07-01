Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :todos, :controller => 'todos/create', only: [:create]

  resources :samples, :controller => 'samples/samples', only: [:index]

  get '/maps/:map_id/path/:start_id/:end_id', to: 'find_maps#show'
end
