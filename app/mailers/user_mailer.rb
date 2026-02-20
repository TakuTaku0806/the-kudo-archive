class NotificationMailer < ApplicationMailer
  def welcome_email(user_email)
    @user_email = user_email
    @url = "https://thekudoarchive.com" # Replace with your real URL
    
    mail(
      to: @user_email,
      subject: "Welcome to The Kudo Archive | Your Journey Begins",
      from: "The Kudo Archive <#{ENV['SMTP_EMAIL']}>"
    )
  end
end