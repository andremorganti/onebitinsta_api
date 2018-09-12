class Api::V1::PostsController < Api::V1::ApiController
  def index
    @posts = User.find(params[:user_id]).posts
    render json: { posts: @posts }
  end


  def create
    @post = current_user.posts.build(post_params)
    save_post || render_error(@post.errors.full_messages)
  end


  def show
    @post = Post.find(params[:id])
    render_post
  end


  def update
    @post = current_user.posts.find(params[:id])
    @post.attributes = post_params
    save_post || render_error(@post.errors.full_messages)
  end


  def destroy
    @post = current_user.posts.find(params[:id])
    destroy_post || render_error(@post.errors.full_messages)
  end


  private


  def save_post
    render_post if @post.save
  end


  def destroy_post
    head :ok if @post.destroy
  end


  def render_post
    render json: { post: { photo: rails_blob_url(@post.photo), description: @post.description } }
  end


  def post_params
    params.require(:post).permit(:photo, :description)
  end
end
