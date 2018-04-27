class Api::V1::PostsController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    @post = Post.new(post_params)
    if @post.valid?
      @post.save
      render json: { user_id: @post.user_id, feelings: @post.feelings }, status: 202
    else
      render json: { message: "#{@post.errors.messages.keys[0]} #{@post.errors[@post.errors.messages.keys[0]][0]}" }, status: 404
    end
  end

  private

  def post_params
    #may have to edit depending on frontend form
    params.require(:post).permit(:user_id, :feelings)
  end
end

#FOR TESTING FETCH TO CREATE POST
# fetch('http://localhost:3000/api/v1/posts', {
#   method: 'POST',
#   body: JSON.stringify({
#     user_id: 3,
#     feelings: "spirit dog golden retriever"
#   }),
#   headers: {
#     'content-type': 'application/json'
#   }
# })
# .then(res => res.json())
# .then(json => console.log(json))
