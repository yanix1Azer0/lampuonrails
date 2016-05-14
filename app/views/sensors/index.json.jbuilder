json.array!(@sensors) do |sensor|
  json.extract! sensor, :id, :nama, :deskripsi, :jenis
  json.url sensor_url(sensor, format: :json)
end
