json.array!(@takes) do |take|
  json.extract! take, :id, :onlaine, :user_id
  json.url take_url(take, format: :json)
end
