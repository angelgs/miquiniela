json.array!(@seasons) do |season|
  json.extract! season, :name, :start_at, :end_at
  json.url season_url(season, format: :json)
end
