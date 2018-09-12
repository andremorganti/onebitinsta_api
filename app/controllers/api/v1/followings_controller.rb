class Api::V1::FollowingsController < Api::V1::ApiController
  def index
    user = User.find(params[:user_id])
    followers = UserSerializer.new(user.followers.map(&:follower)).serializable_hash
    followings = UserSerializer.new(user.followeds.map(&:followed)).serializable_hash
    render json: { followers: followers, followings: followings }
  end


  def create
    @following = current_user.followeds.build(followed_id: params[:user_id])
    save_following || render_error(@following.errors.full_messages)
  end


  def destroy
    @following = current_user.followeds.find(params[:id])
    destroy_following || render_error("This following can't be destroyed")
  end


  private


  def save_following
    render json: { following: @following } if @following.save
  end


  def destroy_following
    head :ok if @following.destroy
  end


  def render_error(errors)
    render json: { errors: errors }, status: :unprocessable_entity
  end
end
