json.reservation do
  json.id @reservation.id
  json.field @reservation.hours.first.field
  json.users @reservation.users
  json.count @reservation.users.count
end


