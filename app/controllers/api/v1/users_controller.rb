class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:index, :create, :show]
  wrap_parameters :user, include: [:first_name, :last_name, :email, :password, :password_confirmation]

  #example with notes
  def index
    @users = User.all
    render json: @users.to_json(only: [:id, :first_name, :last_name, :email]), status: 200
  end

  def show
    @user = User.find_by(id: params[:id])
    # @last_post = @user.posts.last
    #
    # if @last_post
    #   render json: { id: @user.id, email: @user.email, first_name: @user.first_name, last_name: @user.last_name, last_post_id: @last_post.id, last_post_created_at: @last_post.created_at, last_post_feelings: @last_post.feelings, last_post_dog_spirit: @last_post.dog_spirit }, status: 200
    # else
    #   render json: { id: @user.id, email: @user.email, first_name: @user.first_name, last_name: @user.last_name }, status: 200
    # end

    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      #creates a token with a payload of user's id
      token = encode_token({ user_id: @user.id })
      render json: { id: @user.id, email: @user.email, first_name: @user.first_name, last_name: @user.last_name, jwt: token }, status: 202
    else
      render json: { message: "#{@user.errors.messages.keys[0]} #{@user.errors[@user.errors.messages.keys[0]][0]}" }, status: 404
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
