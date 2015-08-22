class UserMailer < ApplicationMailer
 
  def welcome_email(user)
    @user = user
    @url  = 'http://bible-fitbit.herokuapp.com/'
    mail(to: @user.email, subject: 'Welcome to Bible Fitbit!')
  end

  def friend_email(friend_request)
  	@friend_request = friend_request
  	mail(to: @friend_request.friend.email, subject: 'You have a new friend request from #{@friend_request.user.firstname}!')
  end
end