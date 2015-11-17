json.array!(@categories) do |category|
  json.extract! category, :id, :title, :created_at, :updated_at
  json.url category_url(category, format: :json)
end