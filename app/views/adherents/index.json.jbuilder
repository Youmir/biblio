json.array!(@adherents) do |adherent|
  json.extract! adherent, :id, :nom, :prenom, :CIN
  json.url adherent_url(adherent, format: :json)
end
