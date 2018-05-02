class Api::V1::SelfiesController < ApplicationController
  skip_before_action :authorized, only: [:create, :index]

  def create
    @selfie = Selfie.new(selfie_params)
    if @selfie.valid?
      @selfie.save
      render json: { user_id: @selfie.user_id, link: @selfie.link, anger: @selfie.anger, contempt: @selfie.contempt, disgust: @selfie.disgust, fear: @selfie.fear, happiness: @selfie.happiness, neutral: @selfie.neutral, sadness: @selfie.sadness, surprise: @selfie.surprise, status: 202 }
    else
      render json: { message: "#{@selfie.errors.messages.keys[0]} #{@selfie.errors[@selfie.errors.messages.keys[0]][0]}", status: 404 }
    end
  end

  def index
    @selfies = Selfie.all
    render json: @selfies.to_json, status: 200
  end

  private

  def selfie_params
    #may have to edit depending on frontend form
    params.require(:selfie).permit(:user_id, :link, :anger, :contempt, :disgust, :fear, :happiness, :neutral, :sadness, :surprise)
  end
end
