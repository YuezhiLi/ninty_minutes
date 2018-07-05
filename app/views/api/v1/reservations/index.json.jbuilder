json.reservations do
  json.array! @reservations do |r|
    json.field r.hours.first.field
    json.id r.id
    json.start_time r.start_time.strftime("%A, %d %b %Y %l:%M %p")
    json.end_time r.end_time.strftime("%A, %d %b %Y %l:%M %p")
    json.users_number r.users.count
  end
end
