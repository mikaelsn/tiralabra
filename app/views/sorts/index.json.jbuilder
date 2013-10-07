json.array!(@sorts) do |sort|
  json.extract! sort, :name, :runtime, :input
  json.url sort_url(sort, format: :json)
end
