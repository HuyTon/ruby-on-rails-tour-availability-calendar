Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tours
  resources :availabilities
  resources :availability_rules

  get '/api/get_availability_tours', to: 'api#get_availability_tours'
  post '/api/create_tour_availability', to: 'api#create_tour_availability'
end
