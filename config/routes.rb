Rails.application.routes.draw do
  post '/status', to: 'esp8266s#update_status'
  
  resources :rfid_cards
  resources :esp8266s, only: [:index, :create, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end