class StrainsController < ApplicationController
  before_action :set_strain, only: %i[ show edit update destroy ]
  before_action :authorize_admin!, except: [:index, :new, :create ]
  
  # GET /strains or /strains.json
  def index
    @strains = Strain.all
  end

  # GET /strains/1 or /strains/1.json
  def show
  end

  # GET /strains/new
  def new
    @strain = Strain.new
  end

  # GET /strains/1/edit
  def edit
  end

  # POST /strains or /strains.json
  def create
    @strain = Strain.new(strain_params)

    respond_to do |format|
      if @strain.save
        format.html { redirect_to @strain, notice: "Strain was successfully created." }
        format.json { render :show, status: :created, location: @strain }
      else
        format.html { render :new }
        format.json { render json: @strain.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /strains/1 or /strains/1.json
  def update
    respond_to do |format|
      if @strain.update(strain_params)
        format.html { redirect_to @strain, notice: "Strain was successfully updated." }
        format.json { render :show, status: :ok, location: @strain }
      else
        format.html { render :edit }
        format.json { render json: @strain.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /strains/1 or /strains/1.json
  def destroy
    @strain.destroy
    respond_to do |format|
      format.html { redirect_to strains_url, notice: "Strain was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_strain
      @strain = Strain.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def strain_params
      params.require(:strain).permit(:name, :available)
    end
end
