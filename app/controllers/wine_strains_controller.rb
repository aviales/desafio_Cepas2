class WineStrainsController < ApplicationController
  before_action :set_wine_strain, only: %i[ show edit update destroy ]

  # GET /wine_strains or /wine_strains.json
  def index
    @wine_strains = WineStrain.all
  end

  # GET /wine_strains/1 or /wine_strains/1.json
  def show
  end

  # GET /wine_strains/new
  def new
    @wine_strain = WineStrain.new
  end

  # GET /wine_strains/1/edit
  def edit
  end

  # POST /wine_strains or /wine_strains.json
  def create
    @wine_strain = WineStrain.new(wine_strain_params)

    respond_to do |format|
      if @wine_strain.save
        format.html { redirect_to @wine_strain, notice: "Wine strain was successfully created." }
        format.json { render :show, status: :created, location: @wine_strain }
      else
        format.html { render :new }
        format.json { render json: @wine_strain.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wine_strains/1 or /wine_strains/1.json
  def update
    respond_to do |format|
      if @wine_strain.update(wine_strain_params)
        format.html { redirect_to @wine_strain, notice: "Wine strain was successfully updated." }
        format.json { render :show, status: :ok, location: @wine_strain }
      else
        format.html { render :edit }
        format.json { render json: @wine_strain.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wine_strains/1 or /wine_strains/1.json
  def destroy
    @wine_strain.destroy
    respond_to do |format|
      format.html { redirect_to wine_strains_url, notice: "Wine strain was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wine_strain
      @wine_strain = WineStrain.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def wine_strain_params
      params.require(:wine_strain).permit(:wine_id, :strain_id, :percentage)
    end
end
