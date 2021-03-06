class ApplicationController < ActionController::API
  #PAUSED ON AUTH SETUP
  before_action :authorized
  #
  # #taking the frontend and encoding
  def encode_token(payload)
    JWT.encode(payload, "sqlit")
  end

  #frontend checking authorization?
  def auth_header
    request.headers["Authorization"]
  end

  def decoded_token
    if auth_header
        token = auth_header.split(" ")[1] #header: {'Authorization': 'Bearer JWTTOKEN'} for frontend fetch
        begin
          JWT.decode(token, "sqlit", true, { algorithm: "HS256" })
        rescue JWT::DecodeError
          [{}]
        end
    end
  end

  #used for auth after logged_in
  def current_user
    if decoded_token
      user_id = decoded_token[0]["user_id"]
      @user = User.find_by(id: user_id)
    end
  end

  #making sure logged in for backend
  def logged_in?
    !!current_user
  end

  def authorized
    render json: {message: "Please log in"}, status: 401 unless logged_in?
  end

end
