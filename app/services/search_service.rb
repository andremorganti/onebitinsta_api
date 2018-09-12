class SearchService
  def initialize(expression)
    @expression = expression
  end


  def call
    {
      users: search_users,
      posts: search_hashtags
    }
  end


  private


  def search_users
    User.where("email LIKE ?", "%#{@expression}%")
  end


  def search_hashtags
    Post.joins(hashtag_mappings: :hashtag).where("hashtags.name LIKE ?", "%#{@expression}%")
  end
end
