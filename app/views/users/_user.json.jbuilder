json.extract! user, :id, :username, :password, :displayName, :profilePic, :created_at, :updated_at
json.url user_url(user, format: :json)
