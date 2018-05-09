class Api::V1::AuthController < ApplicationController
  # #anyone can view this page. Just the show and create pages
  skip_before_action :authorized, only: [:create, :show]

  def create
    @user = User.find_by(email: user_login_params[:email])

    #if user login matches. jwt token created and given
    if @user && @user.authenticate(user_login_params[:password])
      token = encode_token({ user_id: @user.id })
      render json: { id: @user.id, email: @user.email, first_name: @user.first_name, last_name: @user.last_name, jwt: token }, status: 202
    else
      render json: { message: "Invalid email or password" }, status: 401
    end
  end

  def show
    #Found user. then make jwt token encoded
    if !!current_user #current_user comes from application controller; is current user loggined? show page
      token = encode_token({ user_id: current_user.id })
      render json: { id: current_user.id, email: current_user.email, first_name: current_user.first_name, last_name: current_user.last_name, jwt: token }, status: 200
    else
      render json: { message: "User not found" }, status: 404
    end
  end

  private

  def user_login_params
    params.permit(:email, :password)
  end
end
