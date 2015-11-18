json.array!(@operators) do |operator|
  json.extract! operator, :id, :name, :email
  json.url operator_url(operator, format: :json)
end
