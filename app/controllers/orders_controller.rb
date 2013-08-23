class OrdersController < ApplicationController
  def make_payment
    if cookies["order"].nil?
      redirect_to root_path, notice: "Not product on order"  
    end
    @items = JSON.parse(cookies["order"])["items"]
  end
end