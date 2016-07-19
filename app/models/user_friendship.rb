class UserFriendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, class_name: 'User', foreign_key: 'friend_id'

  attr_accessible :friend, :user, :friend_id, :user_id
end
