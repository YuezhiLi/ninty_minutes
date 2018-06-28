json.fields do
  json.array! @fields do |f|
    json.id f.id
    json.title f.title
    json.location f.location
    json.cover_image f.cover_image
  end
end
