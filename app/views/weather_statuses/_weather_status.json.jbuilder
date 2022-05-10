json.extract! weather_status, :id, :driver_id, :state, :areaDesc, :headline, :description, :effective, :expires, :severity, :notified, :created_at, :updated_at
json.url weather_status_url(weather_status, format: :json)
