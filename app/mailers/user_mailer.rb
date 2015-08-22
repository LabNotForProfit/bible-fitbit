class UserMailer < ApplicationMailer
 
  def welcome_email(user)
    @user = user
    @url  = 'http://bible-fitbit.herokuapp.com/'
    mail(to: @user.email, subject: 'Welcome to Bible Fitbit!')
  end
end