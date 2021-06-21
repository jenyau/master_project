class Admin::NewsController < Admin::BaseController
  before_action :set_news, only: [:show, :edit, :update, :destroy]

  def index
    @news = News.all.order('created_at desc').page(params[:page])
  end

  def show
  end

  def new
    @news = News.new
  end

  def create
    @news = News.new(news_params)

    if @news.save
      flash[:notice] = 'Успешно создана'
      redirect_to [:admin, @news]
      # status_notification = SendingOfLetters.new(@news).call
      # notification(status_notification)
    else
      flash[:error] = 'Произошла ошибка, запись не создана'
      render :new
    end
  end

  def edit
  end

  def update
    if @news.update(news_params)
      flash[:notice] = 'Запись успешно обновлена'
      redirect_to [:admin, @news]
    else
      flash[:error] = 'Произошла ошибка, запись не создана'
      render :edit
    end
  end

  def destroy
    @news.destroy
    flash[:notice] = 'Запись успешно удалена'
    redirect_to admin_news_index_path
  end

  private

  def notification(status)
    status ? flash[:notice] = 'Рассылка выполнена' : flash[:error] = 'Произошла ошибка, почта не отправлены'
  end

  def set_news
    @news = News.find(params[:id])
  end

  def news_params
    params.require(:news).permit(:title, :body, :title_image)
  end

end