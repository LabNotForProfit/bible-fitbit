class FriendRequest < ActiveRecord::Base
	after_create :send_friend_email

	belongs_to :user
	belongs_to :friend, :class_name => 'User'

	validates :user, presence: true  
	validates :friend, presence: true, uniqueness: { scope: :user } 
	validate :not_self
	validate :not_friends
  validate :not_pending

	# This method will build the actual association and destroy the request
	def accept
		user.friends << friend
		destroy
	end

	def not_self
  	errors.add(:friend, "can't be equal to user") if user == friend
	end  

	def not_friends
    errors.add(:friend, 'is already added') if user.friends.include?(friend)

  end

  def not_pending
    errors.add(:friend, 'already requested friendship') if friend.pending_friends.include?(user)
  end

  def send_friend_email
    UserMailer.friend_email(self).deliver
  end
end
