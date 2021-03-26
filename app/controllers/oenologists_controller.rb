class OenologistsController < ApplicationController
  before_action :set_oenologist, only: [:show, :edit, :update, :destroy]
  before_action :magazines_availables, only: [:new, :edit]
  before_action :job_titles_availables, only: [:new, :edit]
  before_action :authorize_admin!, except: [:index, :new ]
  # GET /oenologists
  # GET /oenologists.json
  def index
    @oenologists = Oenologist.all
  end

  # GET /oenologists/1
  # GET /oenologists/1.json
  def show
  end

  # GET /oenologists/new
  def new
    @oenologist = Oenologist.new
  end

  # GET /oenologists/1/edit
  def edit
  end

  # POST /oenologists
  # POST /oenologists.json
  def create
    @oenologist = Oenologist.new(oenologist_params)

    respond_to do |format|
      if @oenologist.save
        @oenologist.set_references(params[:oenologist][:job_titles])

        format.html { redirect_to @oenologist, notice: 'Oenologist was successfully created.' }
        format.json { render :show, status: :created, location: @oenologist }
      else
        format.html { render :new }
        format.json { render json: @oenologist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /oenologists/1
  # PATCH/PUT /oenologists/1.json
  def update
    respond_to do |format|
      if @oenologist.update(oenologist_params)
        @oenologist.set_references(params[:oenologist][:job_titles])

        format.html { redirect_to @oenologist, notice: 'Oenologist was successfully updated.' }
        format.json { render :show, status: :ok, location: @oenologist }
      else
        format.html { render :edit }
        format.json { render json: @oenologist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /oenologists/1
  # DELETE /oenologists/1.json
  def destroy
    @oenologist.destroy
    respond_to do |format|
      format.html { redirect_to oenologists_url, notice: 'Oenologist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def magazines_availables
    @magazines = Magazine.all.order("name")
  end

  def job_titles_availables
    @job_titles = JobTitle.all.order("name")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_oenologist
      @oenologist = Oenologist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def oenologist_params
      params.require(:oenologist).permit(:name, :age, :nationality)
    end
end
