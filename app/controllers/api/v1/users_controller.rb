class Api::V1::UsersController < ApplicationController
  #example with notes
  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.create(user_params)
    render json: @user
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email)
  end
end
