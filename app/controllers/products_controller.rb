class ProductsController < ApplicationController

  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    # raise params["product"][:images].inspect
    @product = Product.new(product_params)
    @product.uuid = SecureRandom.hex
    if @product.save
      @product.tag_list = params["product"][:tag_list]
      if @product.save
        redirect_to product_path(@product)
      end
    else
      redirect_to new_product_path()
    end
  end

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      @product.tag_list = params["product"][:tag_list].join(",")
      if @product.save
        redirect_to product_path(@product)
      end
    end
  end

  def destroy
    if @product.destroy
      redirect_to products_path
    end
  end

  private
  def product_params
    params.require(:product).permit(:sell_status, { images: [] })
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
