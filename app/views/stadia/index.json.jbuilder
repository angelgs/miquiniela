json.array!(@stadia) do |stadium|
  json.extract! stadium, :name
  json.url stadium_url(stadium, format: :json)
end
