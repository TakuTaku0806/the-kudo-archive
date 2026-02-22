user = User.find_by(email: 'kyaroru@yandex.com')
if user
  user.destroy
  puts "SUCCESS: User #{user.email} has been deleted."
else
  puts "NOTICE: User not found. They might already be gone."
end
