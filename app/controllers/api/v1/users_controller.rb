class Api::V1::UsersController < ApplicationController
  #example with notes
  # def index
  #   @notes = Note.all
  #   render json: @notes
  # end
  #
  # def update
  #   @note = Note.find(params[:id])
  #
  #   @note.update(note_params)
  #   if @note.save
  #     render json: @note
  #   else
  #     render json: {errors: @note.errors.full_messages}, status: 422
  #   end
  # end
  #
  # private
  # def note_params
  #   params.permit(:title, :content)
  # end
end
