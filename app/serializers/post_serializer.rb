class PostSerializer
  include FastJsonapi::ObjectSerializer

  belongs_to :user
  has_many :hashtags
  
  attributes :description

  attribute :photo_url do |post|
    if post.photo.attached?
      Rails.application.routes.url_helpers.rails_blob_url(post.photo)
    end
  end

  attribute :like_count do |post|
    post.likes.count
  end
end
