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

# testing fetch
# fetch('http://localhost:3000/api/v1/users', {
#   method: 'POST',
#   body: JSON.stringify({
#     first_name: 'dummy',
#     last_name: 'test',
#     email: 'av@av.co'
#   }),
#   headers: {
#     'content-type': 'application/json'
#   }
# })
# .then(res => res.json())
# .then(json => console.log(json))
