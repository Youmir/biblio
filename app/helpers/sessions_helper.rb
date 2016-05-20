module SessionsHelper
	def log_in(user)
	session[:user_id] = user.id
	end
	
	def current_user
	 @current_user = @current_user || User.find_by(id: session[:user_id])
	end
	
	
	def user_logged_in?
	!current_user.nil?
	end
	
	

	
	
	def user_log_out
		session.delete(:user_id)
		@current_user = nil
	end
	
	
	def user_must_login
  		if !user_logged_in? 
  			flash[:danger] = "This section is reserved for admins.. please connect with an admin account !"
  			redirect_to login_path
  		end
    end

########Editeur session params

    def editeur_log_in(editeur)
		session[:editeur_id] = editeur.id
	end


	def current_editeur
	 @current_editeur = @current_editeur || Editeur.find_by(id: session[:editeur_id])
	end

	def editeur_log_out
		session.delete(:editeur_id)
		@current_editeur = nil
	end
	
	def editeur_logged_in?
		!current_editeur.nil?
	end

	def editeur_must_login
  		if !editeur_logged_in? && !user_logged_in?
  			flash[:danger] = "Please login as an editor !"
  			redirect_to login_path
  		end
    end
    ########Adherent session params

    def adherent_log_in(adherent)
		session[:adherent_id] = adherent.id
	end


	def current_adherent
	 @current_adherent = @current_adherent || Adherent.find_by(id: session[:adherent_id])
	end

	def adherent_log_out
		session.delete(:adherent_id)
		@current_adherent = nil
	end
	
	def adherent_logged_in?
		!current_adherent.nil?
	end

	def adherent_must_login
  		if !adherent_logged_in? 
  			flash[:danger] = "You must be registered as an adherent !"
  			redirect_to login_path
  		end
    end

    def must_login
  		if !user_logged_in? && !editeur_logged_in? && !adherent_logged_in?
  			flash[:danger] = "Please login !"
  			redirect_to login_path
  		end
  	end
  	def logged_in?
		!current_user.nil? || !current_editeur.nil? || !current_adherent.nil?
	end
end
