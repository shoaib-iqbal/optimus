class ApiController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :authenticate_user

  def authenticate_user
    user = User.find_by(email: request.headers[:email])
    if user
      @current_user = user
    else
      render json: {error: "authentication failed"}
    end
  end

end
