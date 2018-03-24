class ProductsController < ApplicationController

  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.uuid = SecureRandom.base64 32
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
    raise params["product"][:tags].inspect
    if params["product"][:image].nil?
      @product.tag_list.remove_tag!
      @product.tag_list = params["product"][:tags].join(",")
    elsif params["product"][:tags].nil?
      @product.image = params["product"][:image]
    end
    redirect_to product_path()
  end

  def destroy
    if @product.destroy
      redirect_to products_path
    end
  end

  private
  def product_params
    params.require(:product).permit(:sell_status, :image)
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
