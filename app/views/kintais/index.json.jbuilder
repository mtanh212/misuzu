json.array!(@kintais) do |kintai|
  json.extract! kintai, :id, :first_name, :last_name
  json.url kintai_url(kintai, format: :json)
end
