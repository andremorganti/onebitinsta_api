class Following < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  validates :followed, uniqueness: { scope: :follower_id }
  validates_with SelfFollowingValidator
end
