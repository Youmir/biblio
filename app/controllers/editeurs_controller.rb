class EditeursController < ApplicationController
  before_action :set_editeur, only: [:show, :edit, :update, :destroy]

  # GET /editeurs
  # GET /editeurs.json
  def index
    @editeurs = Editeur.all
  end

  # GET /editeurs/1
  # GET /editeurs/1.json
  def show
  end

  # GET /editeurs/new
  def new
    @editeur = Editeur.new
  end

  # GET /editeurs/1/edit
  def edit
  end

  # POST /editeurs
  # POST /editeurs.json
  def create
    @editeur = Editeur.new(editeur_params)

    respond_to do |format|
      if @editeur.save
        format.html { redirect_to root_path, notice: 'Editeur was successfully created.' }
        format.json { render :show, status: :created, location: @editeur }
      else
        format.html { render :new }
        format.json { render json: @editeur.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /editeurs/1
  # PATCH/PUT /editeurs/1.json
  def update
    respond_to do |format|
      if @editeur.update(editeur_params)
        format.html { redirect_to @editeur, notice: 'Editeur was successfully updated.' }
        format.json { render :show, status: :ok, location: @editeur }
      else
        format.html { render :edit }
        format.json { render json: @editeur.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /editeurs/1
  # DELETE /editeurs/1.json
  def destroy
    @editeur.destroy
    respond_to do |format|
      format.html { redirect_to editeurs_url, notice: 'Editeur was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_editeur
      @editeur = Editeur.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def editeur_params
      params.require(:editeur).permit(:username, :email, :password)
    end
end
