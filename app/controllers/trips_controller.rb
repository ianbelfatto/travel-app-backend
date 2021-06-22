class TripsController < ApplicationController
  before_action :authenticate_user
  def create
    trip = Trip.new(
      user_id: current_user.id,
      name: params[:name],
      city: params[:city],
      state: params[:state],
      image_url: params[:image_url]
    )
    if trip.save
      render json: { message: "Trip created successfully" }, status: :created
    else
      render json: { errors: trip.errors.full_messages }, status: :bad_request
    end
  end

  def index
    trips = current_user.trips
    render json: trips, include: "trip_businesses.business"
  end

  def show
    trip = current_user.trips.find_by(id: params[:id])
    render json: trip, include: "trip_businesses.business"
  end

  def update
    trip = current_user.trips.find_by(id: params[:id])
    trip.name = params[:name] || trip.name
    trip.city =params[:city] || trip.city
    trip.state = params[:state] || trip.state
    trip.image_url = params[:image_url] || trip.image_url
    trip.save
    render json: trip
  end

  def destroy
    trip = current_user.trips.find_by(id: params[:id])
    trip.destroy
    render json: {
      message: "Trip successfully deleted!",
      errors:  trip.errors.full_messages
     }
  end

end

