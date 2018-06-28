json.field do
  json.id @field.id
  json.title @field.title
  json.location @field.location
  json.cover_image @field.cover_image
  json.available_hours @available_hours
  json.reservations @reservations
end


