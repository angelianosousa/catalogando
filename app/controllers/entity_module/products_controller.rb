class EntityModule::ProductsController < EntitiesController
  before_action :set_product, only: %i[ edit update destroy ]

  # GET /products or /products.json
  def index
    @products = current_entity.products.order(created_at: :desc)
  end

  # GET /products/new
  def new
    @product = current_entity.products.build
  end

  # GET /products/1/edit
  def edit; end

  # POST /products or /products.json
  def create
    @product = current_entity.products.build(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to entity_products_path, flash: { success: "Product was successfully created." } }
        format.json { render :show, status: :created, location: @entity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to entity_products_path, flash: { success: "Product was successfully updated." } }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy!

    respond_to do |format|
      format.html { redirect_to entity_products_path, status: :see_other, flash: { success: "Product was successfully destroyed." } }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = current_entity.products.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :entity_id, :price_cents, :discount, category_ids: [])
    end
end
