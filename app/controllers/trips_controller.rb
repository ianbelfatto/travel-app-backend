class TripsController < ApplicationController
  def create
    trip = Trip.new(
      user_id: params[:user_id],
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
    trips = Trip.all
    render json: trips.as_json
  end

  def show
    trip = Trip.find_by(id: params[:id])
    render json: trip
  end

  def update
    trip = Trip.find_by(id: params[:id])
    trip.name = params[:name] || trip.name
    trip.city =params[:city] || trip.city
    trip.state = params[:state] || trip.state
    trip.image_url = params[:image_url] || trip.image_url
    trip.save
    render json: trip.as_json
  end

  def destroy
    trip = Trip.find_by(id: params[:id])
    trip.destroy
    render json: {message: "Trip successfully deleted!"}
  end

end

