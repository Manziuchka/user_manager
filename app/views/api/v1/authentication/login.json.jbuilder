json.data do
  json.user do
    json.call(
      @user,
      :email,
      :token
    )
  end
end
