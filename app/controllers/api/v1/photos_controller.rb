class Api::V1::PhotosController < ApplicationController
  skip_before_action :authorized, only: [:create, :index]

  def create
    @photo = Photo.new(photo_params)
    if @photo.valid?
      @photo.save
      render json: { user_id: @photo.user_id, selfie: @photo.selfie, anger: @photo.anger, contempt: @photo.contempt, disgust: @photo.disgust, fear: @photo.fear, happiness: @photo.happiness, neutral: @photo.neutral, sadness: @photo.sadness, surprise: @photo.surprise, status: 202 }
    else
      render json: { message: "#{@photo.errors.messages.keys[0]} #{@photo.errors[@photo.errors.messages.keys[0]][0]}", status: 404 }
    end
  end

  def index
    @photos = Photo.all
    render json: @photos.to_json, status: 200
  end

  private

  def photo_params
    #may have to edit depending on frontend form
    params.permit(:user_id, :selfie, :anger, :contempt, :disgust, :fear, :happiness, :neutral, :sadness, :surprise)
  end
end
