json.airports do
  json.array!(@airports) do |airport|
    json.code airport.iata_code
    json.name airport.name
  end
end