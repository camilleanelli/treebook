class Status < ActiveRecord::Base
  belongs_to :user

  validates :content, presence: true,
                      length: { minimum: 2 }

 def status_of_user?(user)
   return true if self.user == user
 end
end
