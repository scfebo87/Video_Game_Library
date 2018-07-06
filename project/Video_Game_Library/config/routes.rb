Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'application#index'
    resources :users do
        resources :consoles, only: [:index, :show, :new, :edit] do
            resources :games, only: [:index, :show, :new, :edit]
        end
    end
    resources :consoles
    resources :games
    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
end
