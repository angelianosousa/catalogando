class EntityModule::StocksController < EntitiesController
  before_action :set_stock, only: %i[ edit update destroy ]

  # GET /entity_module/stocks or /entity_module/stocks.json
  def index
    @stocks = current_entity.stocks
  end

  # GET /entity_module/stocks/new
  def new
    @stock = current_entity.stocks.new
  end

  # GET /entity_module/stocks/1/edit
  def edit; end

  # POST /entity_module/stocks or /entity_module/stocks.json
  def create
    @stock = current_entity.stocks.new(stock_params)

    respond_to do |format|
      if @stock.save
        format.html { redirect_to entity_stocks_path, notice: "Stock was successfully created." }
        format.json { redirect_to entity_stocks_path, status: :created, location: @stock }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entity_module/stocks/1 or /entity_module/stocks/1.json
  def update
    respond_to do |format|
      if @stock.update(stock_params)
        format.html { redirect_to entity_stocks_path, notice: "Stock was successfully updated." }
        format.json { redirect_to entity_stocks_path, status: :ok, location: @stock }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entity_module/stocks/1 or /entity_module/stocks/1.json
  def destroy
    @stock.destroy!

    respond_to do |format|
      format.html { redirect_to entity_stocks_path, status: :see_other, notice: "Stock was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock
      @stock = current_entity.stocks.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def stock_params
      params.require(:stock).permit(:quantity, :cost_unit, :product_id)
    end
end
