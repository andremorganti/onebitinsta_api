class Api::V1::UsersController < Api::V1::ApiController
  def show
    @user = User.find(params[:id])
    render json: UserSerializer.new(@user).serializable_hash
  end
end
