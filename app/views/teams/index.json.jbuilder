json.array!(@teams) do |team|
  json.extract! team, :name, :image
  json.url team_url(team, format: :json)
end
