Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'application#index'
    resources :users do
        resources :consoles, only: [:index, :show, :new, :edit]
    end
    resources :consoles
    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
end
