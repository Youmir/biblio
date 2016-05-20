class Adherent < ActiveRecord::Base
	has_many  :livres
	has_secure_password
end
