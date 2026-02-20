class NotificationMailer < ApplicationMailer
  def test_email
    mail(
      to: "karoldrobro12@gmail.com",
      from: ENV['SMTP_EMAIL'],
      subject: "Dotenv and Mailer Test",
      body: "If you see this, your SMTP settings are finally working!"
    )
  end
end