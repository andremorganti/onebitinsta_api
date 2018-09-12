class Api::V1::HomeController < Api::V1::ApiController
  def index
    post_owners = current_user.followeds.pluck(:user_id)
    post_owners << current_user.id
    @posts = Post.where(user_id: post_owners)
    serialize_posts
  end


  private


  def serialize_posts
    render json: PostSerializer.new(@posts, { include: [:user, :hashtags] }).serializable_hash
  end
end
