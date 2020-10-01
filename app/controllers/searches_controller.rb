class SearchesController < ApplicationController

  def show
    @name = params[:name]
    @name.strip if @name.present?
    @products = Product.search_name(@name)
  end

  def new
  end
end