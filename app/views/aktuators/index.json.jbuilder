json.array!(@aktuators) do |aktuator|
  json.extract! aktuator, :id, :nama, :deskripsi, :jenis, :watt
  json.url aktuator_url(aktuator, format: :json)
end
