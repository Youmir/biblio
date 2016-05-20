class LivresEmpruntesController < ApplicationController
  before_action :set_livres_emprunte, only: [:show, :edit, :update, :destroy]
  before_action :must_login ,only: [:show ,:new ,:create ,:index ,:update, :destroy]
  # GET /livres_empruntes
  # GET /livres_empruntes.json
  def index
    @livres_empruntes = LivresEmprunte.all
  end

  # GET /livres_empruntes/1
  # GET /livres_empruntes/1.json
  def show
  end

  # GET /livres_empruntes/new
  def new
    @livres_emprunte = LivresEmprunte.new
  end

  # GET /livres_empruntes/1/edit
  def edit
  end

  # POST /livres_empruntes
  # POST /livres_empruntes.json
  def create
    @livres_emprunte = LivresEmprunte.new(livres_emprunte_params)

    respond_to do |format|
      if @livres_emprunte.save
        format.html { redirect_to @livres_emprunte, notice: 'Livres emprunte was successfully created.' }
        format.json { render :show, status: :created, location: @livres_emprunte }
      else
        format.html { render :new }
        format.json { render json: @livres_emprunte.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /livres_empruntes/1
  # PATCH/PUT /livres_empruntes/1.json
  def update
    respond_to do |format|
      if @livres_emprunte.update(livres_emprunte_params)
        format.html { redirect_to @livres_emprunte, notice: 'Livres emprunte was successfully updated.' }
        format.json { render :show, status: :ok, location: @livres_emprunte }
      else
        format.html { render :edit }
        format.json { render json: @livres_emprunte.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /livres_empruntes/1
  # DELETE /livres_empruntes/1.json
  def destroy
    @livres_emprunte.destroy
    respond_to do |format|
      format.html { redirect_to livres_empruntes_url, notice: 'Livres emprunte was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_livres_emprunte
      @livres_emprunte = LivresEmprunte.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def livres_emprunte_params
      params.require(:livres_emprunte).permit(:livre_id, :adherent_id)
    end

end
