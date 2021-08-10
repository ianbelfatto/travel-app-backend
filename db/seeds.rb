User.create!([
  {first_name: "Ian", last_name: "Belfatto", email: "ian@gmail.com", image_url: "https://avatars.githubusercontent.com/u/83246707?v=4", password: "password"},

])

Trip.create!([
  {user_id: 1, name: "The Big Apple", city: "New York", state: "NY", image_url: "https://nycphotojourneys.com/wp-content/uploads/2016/10/nyc-1641447_1280-250x250.jpg"},
])

TripBusiness.create!([

  {trip_id: 1, yelp_business_id: "jZZMmT7Mk3S-fNjXcq3Ksg", comments: "used to live by here, amazing coffee, wall of plants - great ambience"},
])

TripEvent.create!([
  {trip_id: 1, yelp_event_id: "new-york-cocktail-creation-with-good-time-mixology", comments: nil},
])

