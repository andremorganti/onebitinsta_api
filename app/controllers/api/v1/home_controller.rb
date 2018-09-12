class Api::V1::HomeController < Api::V1::ApiController
  def index
    post_owners = current_user.followeds.pluck(:user_id)
    post_owners << current_user.id
    @posts = Post.where(user_id: post_owners)
    render json: { posts: @posts }
  end
end
