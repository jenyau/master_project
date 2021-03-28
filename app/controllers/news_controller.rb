class NewsController < ApplicationController
  def index
    @news = News.all.order('created_at desc').page(params[:page])
  end

  def show
    @news = News.find(params[:id])
  end
end