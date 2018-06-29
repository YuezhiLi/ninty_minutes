json.reservations do
  json.array! @reservations do |r|
    json.field r.hours.first.field
    json.id r.id
    json.start_time r.start_time
    json.end_time r.end_time
    json.users_number r.users.count
  end
end
