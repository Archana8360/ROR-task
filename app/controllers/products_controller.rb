class ProductsController < ApplicationController
    before_action :set_product, only: %i[show edit update destroy]
  
    # GET /products
    # GET /products.json
    def index
      @products = Product.order(:name).page(params[:page]).per(10) # Pagination with 10 items per page
      @top_5_products = Product.order(amount: :desc).limit(5) # Fetch top 5 products based on 'amount' attribute
    end
  
    # GET /products/1
    # GET /products/1.json
    def show
    end
  
    # GET /products/new
    def new
      @product = Product.new
    end
  
    # GET /products/1/edit
    def edit
    end
  
    # POST /products
    # POST /products.json
    def create
      @product = Product.new(product_params)
      respond_to do |format|
        if @product.save
          format.html { redirect_to @product, notice: 'Product was successfully created.' }
          format.json { render :show, status: :created, location: @product }
        else
          format.html { render :new }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /products/1
    # PATCH/PUT /products/1.json
    def update
      respond_to do |format|
        if @product.update(product_params)
          format.html { redirect_to @product, notice: 'Product was successfully updated.' }
          format.json { render :show, status: :ok, location: @product }
        else
          format.html { render :edit }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /products/1
    # DELETE /products/1.json
    def destroy
      @product.destroy
      respond_to do |format|
        format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_product
        @product = Product.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def product_params
        params.require(:product).permit(:name, :amount)
      end
  end
  