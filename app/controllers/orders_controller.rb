class OrdersController < ApplicationController
    before_action :set_order, only: %i[show edit update destroy]

    # GET /orders
    def index
      if params[:page].present?
        @orders = Order.order(created_at: :desc).page(params[:page]).per(10) # Apply policy scope and pagination
        authorize @orders
        render json: { status: :ok, data: @orders }
      else
        @top_5_orders = Order.order(amount: :desc).limit(5)
        authorize @top_5_orders
        render json: { status: :ok, data: @top_5_orders }
      end
    end
    
  
    # GET /orders/1.json
    def show
      authorize @order
      render json: { status: :ok, data: @order }
    end
  
    # GET /orders/new
    def new
      @order = Order.new
    end
  
    # GET /orders/1/edit
    def edit
    end
  
    # POST /orders
    # POST /orders.json
    def create
      @order = Order.new(order_params)
      authorize @order

      if @order.save
        render json: { status: :created, message: 'Order was successfully created.', data: @order }, status: :created
      else
        render json: { errors: @order.errors.full_messages }, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /orders/1.json
    def update
      authorize @order
      
      if @order.update(order_params)
        render json: { status: :ok, message: 'Order was successfully updated.', data: @order }, status: :ok
      else
        render json: { errors: @order.errors.full_messages }, status: :unprocessable_entity
      end
    end

  
    # DELETE /orders/1
    def destroy
      authorize @order
      @order.destroy
      
      render json: { status: :ok, message: 'Order was successfully destroyed.' }, status: :ok
    end

  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_order
        @order = Order.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def order_params
        params.require(:order).permit(:amount, :order_date, :payment_id, :customer_id, :seller_id, :product_id)
      end
  end