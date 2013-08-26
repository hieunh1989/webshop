class OrdersController < ApplicationController
  def make_payment
    if cookies["cart"].nil?
      redirect_to root_path, notice: "Not product on order"  
    end
    @items = JSON.parse(cookies["cart"])["items"]
  end
end