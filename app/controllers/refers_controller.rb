class RefersController < ApplicationController
  before_action :set_refer, only: [:show, :edit, :update, :destroy]
 before_filter :authenticate_user!
  # GET /refers
  # GET /refers.json
  def index
    @refers = Refer.all
  end

  # GET /refers/1
  # GET /refers/1.json
  def show
  end

  # GET /refers/new
  def new
    @refer = Refer.new
  end

  # GET /refers/1/edit
  def edit
  end

  # POST /refers
  # POST /refers.json
  def create
    @refer = Refer.new(refer_params)

    respond_to do |format|
      if @refer.save
        format.html { redirect_to @refer, notice: 'Refer was successfully created.' }
        format.json { render :show, status: :created, location: @refer }
      else
        format.html { render :new }
        format.json { render json: @refer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /refers/1
  # PATCH/PUT /refers/1.json
  def update
    respond_to do |format|
      if @refer.update(refer_params)
        format.html { redirect_to @refer, notice: 'Refer was successfully updated.' }
        format.json { render :show, status: :ok, location: @refer }
      else
        format.html { render :edit }
        format.json { render json: @refer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /refers/1
  # DELETE /refers/1.json
  def destroy
    @refer.destroy
    respond_to do |format|
      format.html { redirect_to refers_url, notice: 'Refer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_refer
      @refer = Refer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def refer_params
      params.require(:refer).permit(:name, :email, :registered_on, :phnumber, :refid)
    end
end
