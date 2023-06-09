class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin, except: [:show, :create, :index]
  before_action :set_order, only: %i[ show edit update destroy ]

  include Pagy::Backend
  # GET /orders or /orders.json
  def index
    orders = Order.includes(:product, :user).all
    unless current_user.admin?
      orders = orders.where(user_id: current_user.id)
    end
    orders = orders.where(status: params[:status]) if params[:status].present?
    @pagy, @orders = pagy(orders)
  end

  # GET /orders/1 or /orders/1.json
  def show
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        product = @order.product
        product.update(stock: product.stock - 1)
        format.html { redirect_to order_url(@order), notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if order_params[:tracking_number].present? && @order.update(tracking_number: order_params[:tracking_number], status: "shipped")
        format.html { redirect_to order_url(@order), notice: "Order was successfully shipped." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:id, :user_id, :product_id, :status, :tracking_number)
    end
end
