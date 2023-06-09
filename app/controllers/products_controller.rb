class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin
  before_action :set_product, only: %i[ show edit update destroy ]

  include Pagy::Backend
  # GET /products or /products.json
  def index
    products = Product.includes(:category).all
    products = products.where(category_id: params[:category_id]) if params[:category_id].present?
    products = products.where(artist: params[:artist]) if params[:artist].present?
    products = products.where("name ILIKE ? OR description ILIKE ?","%#{params[:search]}%","%#{params[:search]}%") if params[:search].present?
    products = products.order(:name)
    @pagy, @products = pagy(products)
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
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
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
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
      params.require(:product).permit(:id, :name, :description, :sku, :stock, :price, :category_id, :artist, :width, :height, :image)
    end
end
