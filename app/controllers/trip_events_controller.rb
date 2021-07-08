class TripEventsController < ApplicationController
  before_action :authenticate_user
  def create
    trip_event = TripEvent.new(
      trip_id: params[:trip_id],
      yelp_event_id: params[:yelp_event_id],
      comments: params[:comments]
    )
    if trip_event.save
      render json: { message: "TripEvent Instance created successfully" }, status: :created
    else
      render json: { errors: trip_event.errors.full_messages }, status: :bad_request
    end
  end

  def update
    trip_event = TripEvent.find_by(id: params[:id])
    trip_event.comments = params[:comments]
    if trip_event.save
      render json: { message: "Trip updated successfully", upadted_trip_event: trip_event }, status: :created
    else
      render json: { errors: trip_event.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    trip_event = TripEvent.find_by(id: params[:id])
    trip_event.destroy
    render json: {message: "Trip Event Instance successfully deleted!"}
  end
end
