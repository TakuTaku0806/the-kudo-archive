class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    @url = "https://the-kudo-archive.onrender.com"
    
    mail(
      to: @user.email,
      subject: "Welcome to The Kudo Archive | Your Journey Begins",
      from: "The Kudo Archive <#{ENV['SMTP_EMAIL']}>"
    )
  end
end
