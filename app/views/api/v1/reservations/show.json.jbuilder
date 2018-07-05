json.reservation do
  json.id @reservation.id
  json.start_time @reservation.start_time
  json.end_time @reservation.end_time
  json.field @reservation.field
  json.users @reservation.users
  json.count @reservation.users.count
end


