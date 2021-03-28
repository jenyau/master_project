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
      status_notification = SendingOfLetters.new(@product).call
      notification(status_notification)
        redirect_to [:admin, @product]
    else
      flash[:alert] = 'Произошла ошибка, запись не создана'
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      flash[:notice] = 'Запись успешно обновлена'
      redirect_to [:admin, @product]
    else
      flash[:error] = 'Произошла ошибка, запись не обновлена'
      render :edit
    end
  end

  def destroy
    @product.destroy
    flash[:notice] = 'Запись успешно удалена'
    redirect_to admin_products_path
  end

  private

  def notification(status)
    status ? flash[:notice] = 'Рассылка выполнена' : flash[:error] = 'Произошла ошибка, почта не отправлены'
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :weight, :category, :image, :description)
  end
end