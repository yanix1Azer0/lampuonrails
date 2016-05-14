class RekamsensorsController < ApplicationController
  before_action :set_rekamsensor, only: [:show, :edit, :update, :destroy]

  # GET /measures
  # GET /measures.json
  def index
    @rekamsensors = Rekamsensor.all
  end

  # GET /measures/1
  # GET /measures/1.json
  def show
  end

  # GET /measures/new
  def new
    @rekamsensor = Rekamsensor.new
  end

  # GET /measures/1/edit
  def edit
  end

  # POST /measures
  # POST /measures.json
  def create
    @rekamsensor = Rekamsensor.new(rekamsensor_params)

    respond_to do |format|
      if @rekamsensor.save
        format.html { redirect_to @rekamsensor, notice: 'Rekamsensor was successfully created.' }
        format.json { render :show, status: :created, location: @rekamsensor }
      else
        format.html { render :new }
        format.json { render json: @rekamsensor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /measures/1
  # PATCH/PUT /measures/1.json
  def update
    respond_to do |format|
      if @rekamsensor.update(rekamsensor_params)
        format.html { redirect_to @rekamsensor, notice: 'Rekamsensor was successfully updated.' }
        format.json { render :show, status: :ok, location: @rekamsensor }
      else
        format.html { render :edit }
        format.json { render json: @rekamsensor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /measures/1
  # DELETE /measures/1.json
  def destroy
    @rekamsensor.destroy
    respond_to do |format|
      format.html { redirect_to rekamsensors_url, notice: 'Rekamsensor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rekamsensor
      @rekamsensor = Rekamsensor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rekamsensor_params
      params.require(:rekamsensor).permit(:nilai)
    end
end
