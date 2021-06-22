class TripBusinessesController < ApplicationController
  before_action :authenticate_user
  def create
    trip_business = TripBusiness.new(
      trip_id: params[:trip_id],
      yelp_business_id: params[:yelp_business_id],
      comments: params[:comments]
    )
    if trip_business.save
      render json: { message: "TripBusiness Instance created successfully" }, status: :created
    else
      render json: { errors: trip_business.errors.full_messages }, status: :bad_request
    end
  end

  def update
    trip_business = TripBusiness.find_by(id: params[:id])
    trip_business.comments = params[:comments]
    if trip_business.save
      render json: { message: "Trip updated successfully", upadted_trip_business: trip_business }, status: :created
    else
      render json: { errors: trip_business.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    trip_business = TripBusiness.find_by(id: params[:id])
    trip_business.destroy
    render json: {message: "Trip Business Instance successfully deleted!"}
  end
end
