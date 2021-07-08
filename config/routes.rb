Rails.application.routes.draw do

  # Users
  post "/users" => "users#create"
  get "/users/me" => "users#show"
  patch "/users/me" => "users#update"
  delete "/users/me" => "users#destroy"

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

  # Trip Events
  post "/tripevent" => "trip_events#create"
  patch "/tripevent/:id" => "trip_events#update"
  delete "/tripevent/:id" => "trip_events#destroy"

  # Businesses (from YELP API)
  get "/businesses/" => "businesses#index"
  get "/businesses/:yelp_business_id" => "businesses#show"

  # Events (from YELP API)
  get "/events" => "events#index"
  get "/events/:yelp_event_id" => "events#show"
end
