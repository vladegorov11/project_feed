json.array! @categories do |category|
  json.id category.id
  json.title category.name
  json.view_count category.view_count
end
