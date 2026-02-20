# test/mailers/previews/notification_mailer_preview.rb
class NotificationMailerPreview < ActionMailer::Preview
  def welcome_email
    # This calls the welcome_email method in your NotificationMailer
    # We pass a test email address to simulate the data
    NotificationMailer.welcome_email("test@example.com")
  end
end