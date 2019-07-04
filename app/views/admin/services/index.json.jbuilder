json.array!(@services) do |service|
  json.extract! service, :name, :description
  json.url service_url(service, format: :json)
end