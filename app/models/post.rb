class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, as: :likeable, dependent: :delete_all

  has_one_attached :photo

  validates :photo, file_presence: true
  validates :description, presence: true
end
