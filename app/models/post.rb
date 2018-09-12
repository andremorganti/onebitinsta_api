class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, as: :likeable, dependent: :delete_all
  has_many :hashtag_mappings, as: :hashtagable
  has_many :hashtags, through: :hashtag_mappings

  has_one_attached :photo

  validates :photo, file_presence: true
  validates :description, presence: true

  after_save :map_hashtags!


  private


  def map_hashtags!
    service = HashtagMappingService.new(self, :description)
    service.call
  end
end
