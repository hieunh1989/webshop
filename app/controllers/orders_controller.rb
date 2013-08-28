class OrdersController < ApplicationController
  def make_payment
    if cookies["basket"].nil?
      redirect_to root_path, notice: "Not product on order" 
      return
    end
    # binding.pry
    @items = JSON.parse(cookies["basket"])["items"]
  end
end