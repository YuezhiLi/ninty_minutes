json.user do
  json.open_id @user.open_id
  json.nickname @user.nickname
  json.avatar_url @user.avatar_url
  json.confirmed_reservations @confirmed_reservations
  json.unconfirmed_reservations @unconfirmed_reservations
end
