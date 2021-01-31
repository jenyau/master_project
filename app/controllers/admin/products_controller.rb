class Admin::ProductsController < Admin::BaseController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all.order(:name).page(params[:page])
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to [:admin, @product]
      ProductMailer.new_product(@product).deliver_now
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to [:admin, @product]
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to admin_products_path
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :weight, :category, :image, :description)
  end
end