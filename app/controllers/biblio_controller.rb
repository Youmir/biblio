class BiblioController < ApplicationController
  before_action :user_must_login ,only: [:valider ,:check, :list_emprunts]
  before_action :must_login , only: [:index]
  before_action :editeur_must_login , only: [:affich_to_mod]
  before_action :adherent_must_login , only: [:emprunter, :rendre, :affich_to_emp, :me_books]

  def index
  end

##### afficher pour emprunter
  def affich
    @livres=Livre.where(estDispo: '1',estValide: '1').all
  end
  
  def affich_to_emp 
    @livres=Livre.where(estDispo: '1',estValide: '1').all
  end 

  def affich_to_mod 
    @livres=Livre.where(editeur: current_editeur.username).all
  end
  def affich_to_des 
    @livres=Livre.where(editeur: current_editeur.username).all
  end  

  def profil
    if user_logged_in?
      @curr= current_user
    elsif editeur_logged_in?
      @curr= current_editeur
    else
      @curr= current_adherent
    end 
          
  end


    
# emprunter
  def emprunter
  	
      mytitre = params[:titre]
      
      @livre = Livre.find_by_titre(mytitre)
      @adherent = Adherent.find_by_nom(current_adherent.nom)
      @livre.estDispo = 0
      @livre.save
      @livres_emp = LivresEmprunte.create(livre_id: @livre.id, adherent_id: @adherent.id)
      @livres_emp.save
      flash[:success] = "Livre emprunté avec succes"
     redirect_to affich_path
      
  end


  def rendre
    mytitre1 = params[:titre]

    @livre1 = Livre.find_by_titre(mytitre1)
    if @livre1 != nil
      @livre1.estDispo = 1
      @livre1.save
      @livre1_emp = LivresEmprunte.find_by_livre_id(@livre1.id)
        if @livre1_emp != nil
          @livre1_emp.destroy
          flash[:success] = "Livre rendu à la bibliotheque avec succes"
          redirect_to affich_path
        else
          @note1 = 'Error'
        end
    else
      @note1 = 'Livre introuvable'
    end
  end



def list_emprunts
@emps = LivresEmprunte.all
if @emps == nil
@note = 'Pas de livres empruntés'
else
respond_to do |format|
format.html
end
end
end

def check
  @nvs = Livre.where(estValide:  '0').all
  if @nvs == nil
@note = 'All books are validated'
else
respond_to do |format|
format.html
end
end

end  

def valider
  myid = params[:id]
  @livret = Livre.find_by_id(myid)
  @livret.estValide = 1
  @livret.save
  redirect_to affich_path
end  


def mebooks
   meid = current_adherent.id 
 @emps = LivresEmprunte.where(adherent_id: session[:adherent_id]).all
if @emps == nil
@note = 'Pas de livres '
else
respond_to do |format|
format.html
end
end
end


  

  
end
