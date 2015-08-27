class TakesController < ApplicationController
  before_action :set_take, only: [:show, :edit, :update, :destroy]

  # GET /takes
  # GET /takes.json
  def index
    @takes = Take.all
  end

  # GET /takes/1
  # GET /takes/1.json
  def show
  end

  # GET /takes/new
  def new
    @take = Take.new
  end

  # GET /takes/1/edit
  def edit
  end

  # POST /takes
  # POST /takes.json
  def create
    @take = Take.new(take_params)

    respond_to do |format|
      if @take.save
        format.html { redirect_to @take, notice: 'Take was successfully created.' }
        format.json { render :show, status: :created, location: @take }
      else
        format.html { render :new }
        format.json { render json: @take.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /takes/1
  # PATCH/PUT /takes/1.json
  def update
    respond_to do |format|
      if @take.update(take_params)
        format.html { redirect_to @take, notice: 'Take was successfully updated.' }
        format.json { render :show, status: :ok, location: @take }
      else
        format.html { render :edit }
        format.json { render json: @take.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /takes/1
  # DELETE /takes/1.json
  def destroy
    @take.destroy
    respond_to do |format|
      format.html { redirect_to takes_url, notice: 'Take was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_take
      @take = Take.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def take_params
      params.require(:take).permit(:onlaine, :user_id)
    end
end
