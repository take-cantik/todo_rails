class Api::UserController < ApiController
  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    @count = @user.columns.count
  end
end
