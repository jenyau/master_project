class SearchesController < ApplicationController

  def show
    @name = params[:name]
    @name.strip if @name.present?
    @product = Product.search_name(@name).first
  end

  def new
  end
end