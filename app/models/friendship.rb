class Friendship < ApplicationRecord
  validate :friend_id, uniqueness: {scope: :user_id} 
  belongs_to :user
  belongs_to :friends, class_name: "User"


end
