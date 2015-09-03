json.array!(@users) do |user|
  json.extract! user, :id, :phone_number, :carrier
  json.url user_url(user, format: :json)
end
