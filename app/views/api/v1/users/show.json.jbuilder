json.user do
  json.call(
    @user,
    :email,
    :name,
    :avatar
  )
end
