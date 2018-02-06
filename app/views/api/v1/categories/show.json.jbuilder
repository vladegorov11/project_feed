json.array! @feeds do |feed|
  json.id feed.id
  json.title feed.title
  json.description feed.description
  json.image feed.image
  json.full_description feed.full_description
end