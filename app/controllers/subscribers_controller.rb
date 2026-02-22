class SubscribersController < ApplicationController
  def create
    @subscriber = Subscriber.new(subscriber_params)

    if @subscriber.save
      # Wysyłka maila powitalnego przy użyciu NotificationMailer
      # Używamy deliver_later, aby nie spowalniać ładowania strony
      NotificationMailer.welcome_email(@subscriber.email).deliver_later
      
      redirect_to root_path, notice: "Dziękujemy za zapisanie się do newslettera!"
    else
      redirect_to root_path, alert: "Nie udało się zapisać: #{@subscriber.errors.full_messages.to_sentence}"
    end
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:email)
  end
end
