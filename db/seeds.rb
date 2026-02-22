user = User.find_by(email: 'kyaroru@yandex.com')
if user
  user.update_columns(admin: true) # update_columns skips validations
  puts "Successfully made #{user.email} an admin"
else
  puts "User not found!"
end
