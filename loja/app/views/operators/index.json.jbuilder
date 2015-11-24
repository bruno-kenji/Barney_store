json.array!(@operators) do |operator|
  json.extract! operator, :id, :name, :email, :password, :sector
  json.url operator_url(operator, format: :json)
end
