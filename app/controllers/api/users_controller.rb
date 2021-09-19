class Api::UsersController < ApiController
  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    logger.debug(@user)
    render json: @user
  end
end
