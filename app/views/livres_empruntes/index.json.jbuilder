json.array!(@livres_empruntes) do |livres_emprunte|
  json.extract! livres_emprunte, :id, :livre_id, :adherent_id
  json.url livres_emprunte_url(livres_emprunte, format: :json)
end
