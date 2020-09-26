class Admin::NewsController < Admin::BaseController
  before_action :set_news, only: [:show, :edit, :update, :destroy]

  def index
    @news = News.all
  end

  def show
  end

  def new
    @news = News.new
  end

  def create
    @news = News.new(news_params)

    if @news.save
      redirect_to [:admin, @news]
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @news.update(news_params)
      redirect_to [:admin, @news]
    else
      render :edit
    end
  end

  def destroy
    @news.destroy
    redirect_to admin_news_path
  end

  private
  def set_news
    @news = News.find(params[:id])
  end

  def news_params
    params.require(:news).permit(:title, :body, :title_image)
  end
end