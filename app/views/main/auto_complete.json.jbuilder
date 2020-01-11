json.airports do
  json.array!(@airports) do |airport|
    json.code airport.iata_code
    json.name "#{airport.iata_code} - #{airport.name}"
  end
end