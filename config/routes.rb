Rails.application.routes.draw do

  # Users
  get "/users/:id" => "users#show"
  post "/users" => "users#create"
  patch "/users/:id" => "users#update"
  delete "/users/:id" => "users#destroy"

  # Trips
  get "/trips" => "trips#index"
  post "/trips" => "trips#create"
  get "/trips/:id" => "trips#show"
  patch "/trips/:id" => "trips#update"
  delete "/trips/:id" => "trips#destroy"

  post "/tripbusiness" => "trip_businesses#create"
  patch "/tripbusiness/:id" => "trip_businesses#update"
  delete "/tripbusiness/:id" => "trip_businesses#destroy"

  post "/sessions" => "sessions#create"

  get "/businesses" => "businesses#index"
  get "/businesses/:yelp_business_id" => "businesses#show"
end
