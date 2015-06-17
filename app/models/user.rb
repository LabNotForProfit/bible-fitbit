class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  # "Class method" # User.get_users       
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
end
