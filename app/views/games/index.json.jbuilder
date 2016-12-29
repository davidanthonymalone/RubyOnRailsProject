json.array!(@games) do |game|
  json.extract! game, :id, :name, :about, :price, :rating, :age_group
  json.url game_url(game, format: :json)
end
