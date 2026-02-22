class NotificationMailer < ApplicationMailer
  # Możesz tu ustawić domyślny adres "od kogo"
  default from: 'notifications@the-kudo-archive.onrender.com'

  def welcome_email(user_email)
    @user_email = user_email
    # Zmienione na Twój adres na Renderze
    @url = "https://the-kudo-archive.onrender.com" 
    
    mail(to: @user_email, subject: "Welcome to The Kudo Archive")
  end
end
