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
end

