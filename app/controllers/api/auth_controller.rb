class Api::AuthController < ApiController
  def user
    if user_signed_in? then
      render json: current_user
    else
      render json: nil
    end
  end
end
