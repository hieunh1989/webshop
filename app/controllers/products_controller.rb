class ProductsController < ApplicationController
  def home
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])    
  end
end