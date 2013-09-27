json.array!(@schedules) do |schedule|
  json.extract! schedule, :number, :start_at, :end_at
  json.url schedule_url(schedule, format: :json)
end
