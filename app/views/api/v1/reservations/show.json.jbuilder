json.reservation do
  json.id @reservation.id
  json.start_time @reservation.start_time.strftime("%A, %d %b %Y %l:%M %p")
  json.end_time @reservation.end_time.strftime("%A, %d %b %Y %l:%M %p")
  json.field @reservation.field
  json.users @reservation.users
  json.count @reservation.users.count
end


