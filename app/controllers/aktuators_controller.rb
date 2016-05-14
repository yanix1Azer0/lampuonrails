class AktuatorsController < ApplicationController
  before_action :set_aktuator, only: [:show, :edit, :update, :destroy]
  
  before_action :authenticate_user!
  # GET /aktuators
  # GET /aktuators.json
  def index
    @aktuators = Aktuator.all
    @page_title='Aktuator'
  end

  # GET /aktuators/1
  # GET /aktuators/1.json
  def show
    @page_title='Aktuator'
  end

  # GET /aktuators/new
  def new
    @aktuator = Aktuator.new
    @page_title='Aktuator'
  end

  # GET /aktuators/1/edit
  def edit
    @page_title='Aktuator'
  end

  # POST /aktuators
  # POST /aktuators.json
  def create
    @aktuator = Aktuator.new(aktuator_params)

    respond_to do |format|
      if @aktuator.save
        format.html { redirect_to @aktuator, notice: 'Aktuator was successfully created.' }
        format.json { render :show, status: :created, location: @aktuator }
      else
        format.html { render :new }
        format.json { render json: @aktuator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aktuators/1
  # PATCH/PUT /aktuators/1.json
  def update
    respond_to do |format|
      if @aktuator.update(aktuator_params)
        format.html { redirect_to @aktuator, notice: 'Aktuator was successfully updated.' }
        format.json { render :show, status: :ok, location: @aktuator }
      else
        format.html { render :edit }
        format.json { render json: @aktuator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aktuators/1
  # DELETE /aktuators/1.json
  def destroy
    @aktuator.destroy
    respond_to do |format|
      format.html { redirect_to aktuators_url, notice: 'Aktuator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aktuator
      @aktuator = Aktuator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aktuator_params
      params.require(:aktuator).permit(:nama, :deskripsi, :jenis, :watt, :kendali)
    end
end
