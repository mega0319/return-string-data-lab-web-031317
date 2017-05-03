class ProductsController < ApplicationController


  def new
    @product = Product.new
  end

  def index
    @products = Product.all
  end

  def inventory
    @product = Product.find(params[:id])
    if @product.inventory
      if @product.inventory > 0
        render plain: "true"
      else
        render plain: "false"
      end
    else
      render plain: "NOT FILLED OUT"
    end
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to products_path
  end

  def show
    @product = Product.find(params[:id])
    render :show
  end

  def description
    @product = Product.find(params[:id])
    render plain: @product.description
  end

  def product_params
    params.require(:product).permit(:name, :price, :description, :inventory)
  end

end
