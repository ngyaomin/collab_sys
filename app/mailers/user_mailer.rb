class UserMailer < ApplicationMailer
  default from: 'alphacampz@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://localhost:3000'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def notification_email(user, post)
    @post = post
    @user = user
    @url = 'http://localhost:3000'
    mail(to: @user[:email] , subject: 'New topic has been added')
  end

  def changes_email(user, post)
    @post = post
    @user = user
    @url = 'http://localhost:3000'
    mail(to: @user[:email] , subject: 'Post has new updates')
  end
end
