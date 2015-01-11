json.array!(@houses) do |house|
  json.extract! house, :id, :name, :type, :solar, :exp, :melange, :material, :population
  json.url house_url(house, format: :json)
end
