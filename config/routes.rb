Rails.application.routes.draw do

  # Users
  post "/users" => "users#create"
  get "/users/:id" => "users#show"
  patch "/users/:id" => "users#update"
  delete "/users/:id" => "users#destroy"

  # Sessions
  post "/sessions" => "sessions#create"

  # Trips
  get "/trips" => "trips#index"
  post "/trips" => "trips#create"
  get "/trips/:id" => "trips#show"
  patch "/trips/:id" => "trips#update"
  delete "/trips/:id" => "trips#destroy"

  # Trip Businesses
  post "/tripbusiness" => "trip_businesses#create"
  patch "/tripbusiness/:id" => "trip_businesses#update"
  delete "/tripbusiness/:id" => "trip_businesses#destroy"

  # Businesses (from YELP API)
  get "/businesses/" => "businesses#index"
  get "/businesses/:yelp_business_id" => "businesses#show"
end
