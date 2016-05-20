json.array!(@editeurs) do |editeur|
  json.extract! editeur, :id, :username, :email, :password_digest
  json.url editeur_url(editeur, format: :json)
end
