json.array! @events do |event|
  json.id event.id
  json.title event.title
  json.place event.city
end
