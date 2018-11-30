Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'application#index'
    resources :users do
        resources :consoles, only: [:index, :show, :new, :create, :edit] do
            resources :games, only: [:new, :create, :edit, :show]
        end
    end
    resources :notes
    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    get '/auth/facebook/callback' => 'fessions#create'
    get '/logout' => 'sessions#destroy'
    post '/logout' => 'sessions#destroy'
    get '/users/:user_id/consoles/:id/destroy' => 'consoles#destroy'
    get '/users/:user_id/consoles/:console_id/games/:id/destroy' => 'games#destroy'
    get '/users/:user_id/most_games' => 'consoles#most'
    get '/users/:user_id/games' => 'users#games'
    post '/users/:user_id/games/:id/notes' => 'notes#create'
    get '/users/:user_id/games/:id/notes' => 'notes#show'
end
