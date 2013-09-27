json.array!(@forecasts) do |forecast|
  json.extract! forecast, :user_id, :game_id, :home_score, :visitor_score
  json.url forecast_url(forecast, format: :json)
end
