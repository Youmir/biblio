class SessionsController < ApplicationController
  include SessionsHelper
  
  def new
    if logged_in?
      redirect_to affich_path
     end 

  end

  def create
    session.delete(:user_id)
    session.delete(:adherent_id)
    session.delete(:editeur_id)
    user = User.find_by(email: params[:email])
    editeur = Editeur.find_by(email: params[:email])
  	adherent = Adherent.find_by(email: params[:email])
    
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		flash[:success] = "welcome"
  		redirect_to root_path
    elsif editeur && editeur.authenticate(params[:password])  
      session[:editeur_id] = editeur.id
      flash[:success] = "welcome"
      redirect_to root_path
    elsif adherent && adherent.authenticate(params[:password])  
      session[:adherent_id] = adherent.id
      flash[:success] = "welcome"
      redirect_to affich_path
  	else 
  		flash.now[:danger]	= "wrong"
      render 'new'
  		
  	end
  end
  def destroy
  	if user_logged_in?
      user_log_out
  	  flash[:success] = "Bye"
  	  redirect_to login_path
    elsif editeur_logged_in?
      editeur_log_out
      flash[:success] = "Bye"
      redirect_to login_path
      
    elsif adherent_logged_in?
      adherent_log_out
      flash[:success] = "Bye"
      redirect_to login_path
    end    
  end	
end
