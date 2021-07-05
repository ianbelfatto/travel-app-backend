class UsersController < ApplicationController
  before_action :authenticate_user, :except => [:create]

  def create
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def show
    user = current_user
    render json: user
  end

  def update
    user = current_user
    user.first_name = params[:first_name] || user.first_name
    user.last_name =params[:last_name] || user.last_name
    user.email = params[:email] || user.email
    user.password = params[:password] || user.password
    user.image_url = params[:image_url] || user.image_url
    if user.save
      render json: { message: "User updated successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    user = current_user
    user.destroy
    render json: {message: "User successfully deleted!"}
  end
end
