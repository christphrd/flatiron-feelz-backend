class Api::V1::PostsController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    byebug
  end
end
