class SearchesController < ApplicationController

  def show
    @name = params[:name]
    @name.strip if @name.present?
    @category = params[:category]
    @product = Product.all.where(name: @name).first
    @products = Product.all.where(category: @category)
  end

  def new
  end
end