json.data do
  json.user do
    if @user.errors.any?
      json.errors @user.errors
    else
      json.id @user.id
      json.email @user.email
    end      
  end
  json.token token
end
