class Api::V1::PartsController < Api::V1::ApiController
  before_action :set_part, only: [:show, :edit, :update, :destroy]
  before_filter :check_admin, only: [:create,:update,:destroy]

  # GET /api/v1/parts
  # GET /api/v1/parts.json
  def index
    @parts = Part.all
    render json: @parts
  end

  # GET /api/v1/parts/1
  # GET /api/v1/parts/1.json
  def show
  end

  # GET /api/v1/parts/new
  def new
    @part = Part.new
  end

  # GET /api/v1/parts/1/edit
  def edit
  end

  # POST /api/v1/parts
  # POST /api/v1/parts.json
  def create
    @part = Part.new(part_params)

    respond_to do |format|
      if @part.save
        format.json { render :show, status: :created, location: @part }
      else
        format.json { render json: @part.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/v1/parts/1
  # PATCH/PUT /api/v1/parts/1.json
  def update    
    respond_to do |format|
      if @part.update(part_params)
        format.json { render json: @parts, status: :ok }
      else
        format.json { render json: @part.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/v1/parts/1
  # DELETE /api/v1/parts/1.json
  def destroy
    @part.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_part
      @part = Part.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def part_params
      params.require(:part).permit(:type_name, :manufacturer, :model, :link, :amzdesc, :amzprice)
    end

    def check_admin
      unless current_admin_user
        render nothing: true, status: 401
      end
    end
end
