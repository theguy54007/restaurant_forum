class Followship < ApplicationRecord
  belongs_to :user
  belongs_to :following_id, class_name:"User"

end
