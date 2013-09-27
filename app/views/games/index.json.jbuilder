json.array!(@games) do |game|
  json.extract! game, :start_at, :stadium_id, :home_team_id, :visitor_team_id
  json.url game_url(game, format: :json)
end
