def create
  @user = User.new(user_params)
  if @user.save
    # This sends the email right after the user is saved to the database
    UserMailer.welcome_email(@user).deliver_later
    redirect_to @user
  end
end