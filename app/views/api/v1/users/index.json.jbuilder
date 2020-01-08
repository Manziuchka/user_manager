json.users @users.each do |user|
  json.name user.name
  json.email user.email
  json.avatar user.avatar
end
