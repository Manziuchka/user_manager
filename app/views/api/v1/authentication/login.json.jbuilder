json.user do
  json.call(
    @user,
    :email
  )
  json.token @token
end
