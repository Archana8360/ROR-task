class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]
  
    # GET /products
    # GET /products.json
    def index
      if params[:page].present?
        @products = Product.order(:name).page(params[:page]).per(10) # Pagination with 10 items per page
      else
        @products = Product.order(amount: :desc).limit(5) # Fetch top 5 products based on 'amount' attribute
      end
    
      render json: { status: :ok, data: @products }
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
  
      if @product.save
        render json: { status: :created, message: 'Product was successfully created.', data: @product }, status: :created
      else
        render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /products/1.json
    def update
      if @product.update(product_params)
        render json: { status: :ok, message: 'Product was successfully updated.', data: @product }, status: :ok
      else
        render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    # DELETE /products/1.json
    def destroy
      @product.destroy
      render json: { status: :ok, message: 'Product was successfully destroyed.' }, status: :ok
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_product
        @product = Product.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def product_params
        params.require(:product).permit(:name, :amount, :page)
      end
  end