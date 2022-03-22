class ProfilsController < ApplicationController
  before_action :set_profil, only: %i[ show edit update destroy ]

  # GET /profils or /profils.json
  def index
    @profils = Profil.all
  end

  # GET /profils/1 or /profils/1.json
  def show
  end

  # GET /profils/new
  def new
    @profil = Profil.new
  end

  # GET /profils/1/edit
  def edit
  end

  # POST /profils or /profils.json
  def create
    @profil = Profil.new(profil_params)

    respond_to do |format|
      if @profil.save
        format.html { redirect_to profil_url(@profil), notice: "Profil was successfully created." }
        format.json { render :show, status: :created, location: @profil }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @profil.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profils/1 or /profils/1.json
  def update
    respond_to do |format|
      if @profil.update(profil_params)
        format.html { redirect_to profil_url(@profil), notice: "Profil was successfully updated." }
        format.json { render :show, status: :ok, location: @profil }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @profil.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profils/1 or /profils/1.json
  def destroy
    @profil.destroy

    respond_to do |format|
      format.html { redirect_to profils_url, notice: "Profil was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profil
      @profil = Profil.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def profil_params
      params.require(:profil).permit(:user_id, :Name, :begin_at, :finish_at, :desc)
    end
end
