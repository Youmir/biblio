json.array!(@livres) do |livre|
  json.extract! livre, :id, :isbn, :titre, :auteur, :estDispo, :estValide
  json.url livre_url(livre, format: :json)
end
