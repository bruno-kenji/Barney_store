json.array!(@sectors) do |sector|
  json.extract! sector, :id, :title
  json.url sector_url(sector, format: :json)
end
