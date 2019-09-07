@users.each do |user|
  json.id user.id
  json.name user.first_name
  json.email user.email
end
