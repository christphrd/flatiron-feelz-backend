class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:index, :create]
  wrap_parameters :user, include: [:first_name, :last_name, :email, :password, :password_confirmation]

  #example with notes
  def index
    @users = User.all
    render json: @users, status: 200
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      token = encode_token({ user_id: @user.id })
      render json: { email: @user.email, first_name: @user.first_name, last_name: @user.last_name, jwt: token }, status: 202
    else
      render json: { message: "#{@user.errors.messages.keys[0]} #{@user.errors[@user.errors.messages.keys[0]][0]}" }, status: 404
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end

# testing fetch
# fetch('http://localhost:3000/api/v1/users', {
#   method: 'POST',
#   body: JSON.stringify({
#     first_name: 'dummy',
#     last_name: 'test',
#     email: 'av@av.co',
#     password: 'workplz',
#     password_confirmation: 'workplz'
#   }),
#   headers: {
#     'content-type': 'application/json'
#   }
# })
# .then(res => res.json())
# .then(json => console.log(json))
