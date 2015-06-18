class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # "Class method" # User.get_users
  # To be used if we want to return a more limited hash than User.all.as_json       
  def self.get_users
  	all_users = {}
  	@users = User.all

  	# Make hash of all users with user email as key and value as hash in which
  	# we can put more data as we add more to the user. 
  	@users.each do |user|
  		all_users[user.email] = {:id => user.id}
	end
	return all_users
  end

  # To be used if we want to return a more limited hash than User.find_by_id(id).as_json 
  def self.get_user(id)
  	user_info = {}

  	# If a user with id doesn't exist, return false. Checkpoint
  	# to make sure we don't go any further in code block if
  	# user doesn't exist
  	unless @user= User.find_by_id(id)
  		return false
  	end

  	# Only use the data that we want from the user object
  	user_info = {:id => @user.id, :email => @user.email}
  	return user_info
  end
end
