class NotificationMailer < ApplicationMailer
  def welcome_email(user_email)
    @user_email = user_email
    @url = "http://localhost:3000"
    mail(to: @user_email, subject: "Welcome to The Kudo Archive")
  end
end