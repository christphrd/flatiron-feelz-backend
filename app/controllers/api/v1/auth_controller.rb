class Api::V1::AuthController < ApplicationController
  # #anyone can view this page. Just the show and create pages
  skip_before_action :authorized, only: [:create, :show]
  #
  def create
    @user = User.find_by(email: user_login_params[:email])

    #if password matches check token
    if @user && @user.authenticate(user_login_params[:password])
      token = encode_token({ user_id: @user.id })
      render json: { email: @user.email, jwt: token }, status: 202
    else
      render json: { message: "Invalid email or password" }, status: 401
    end
  end
  #
  def show
    #Found user. then make jwt token encoded
    if !!current_user #current_user comes from application controller; it finds current user by id found in decoded JWT token
      token = encode_token({ user_id: current_user.id })
      render json: { email: current_user.email, jwt: token }, status: 200
    else
      render json: { message: "User not found" }, status: 404
    end
  end

  private

  def user_login_params
    params.require(:user).permit(:email, :password)
  end
end
