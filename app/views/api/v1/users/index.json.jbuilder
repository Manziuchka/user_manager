json.users @users.each do |user|
  json.user do
    json.name user.name
    json.email user.email
    json.avatar user.avatar
  end
end
