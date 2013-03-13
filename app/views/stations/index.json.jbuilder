json.array!(@stations) do |station|
  json.extract! station, :code, :name, :latitude, :longitude, :gmaps
  json.url station_url(station, format: :json)
end