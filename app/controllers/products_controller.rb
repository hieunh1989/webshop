class ProductsController < ApplicationController
  
  def index
    # binding.pry
    @products = Product.all.select{|p| !p.categories.blank? && p.categories.include?(params[:categories]) }
    
  end

  def home
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])    
  end
end