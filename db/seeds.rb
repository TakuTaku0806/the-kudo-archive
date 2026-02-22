# Znajdź konto, które przed chwilą stworzyłeś
user = User.find_by(email: 'kyaroru@yandex.com')

if user
  user.update_columns(admin: true)
  puts "AUTORYZACJA: Użytkownik #{user.email} został mianowany administratorem."
else
  puts "BŁĄD: Nie znaleziono użytkownika o tym mailu. Sprawdź literówki!"
  puts "Lista kont w bazie: #{User.pluck(:email)}"
end
