class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      # Upewnij się, że masz UserMailer zdefiniowany w app/mailers/user_mailer.rb
      UserMailer.welcome_email(@user).deliver_later
      redirect_to @user
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    # Dodano brakującą metodę parametrów
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
