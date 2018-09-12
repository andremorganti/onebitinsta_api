class PostSerializer
  include FastJsonapi::ObjectSerializer

  belongs_to :user
  has_many :hashtags
  
  attributes :description

  attribute :photo_url do |post|
    Rails.application.routes.url_helpers.rails_blob_path(post.photo) if post.photo.attached?
  end

  attribute :like_count do |post|
    post.likes.count
  end
end
