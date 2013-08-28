class ProductsController < ApplicationController
  
  def index
    @products = Product.all.select{|p| !p.categories.blank? && p.categories.include?(params[:categories]) }
  end

  def home
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])    
  end
end