class Post < ApplicationRecord
  belongs_to :user

  has_one_attached :photo

  validates :photo, file_presence: true  
  validates :description, presence: true
end
