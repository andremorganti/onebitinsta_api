class UserSerializer
  include FastJsonapi::ObjectSerializer
  
  attributes :name, :description, :email

  attribute :photo_url do |post|
    Rails.application.routes.url_helpers.rails_blob_path(post.photo) if post.photo.attached?
  end
end
