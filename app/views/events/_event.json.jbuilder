json.extract! event, :id, :name, :date.datetime, :location, :user_id, :category, :created_at, :updated_at
json.url event_url(event, format: :json)
