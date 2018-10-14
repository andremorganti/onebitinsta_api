class UserSerializer
  include FastJsonapi::ObjectSerializer
  
  attributes :name, :description, :email

  attribute :photo_url do |user|
    if user.photo.attached?
      Rails.application.routes.url_helpers.rails_blob_url(user.photo)
    end 
  end
end
