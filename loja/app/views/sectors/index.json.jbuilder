json.array!(@sectors) do |sector|
  json.extract! sector, :id, :title, :operators
  json.url sector_url(sector, format: :json)
end
