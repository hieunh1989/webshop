class Admin::OrdersController < Admin::BaseController
  def index   
    @orders = Order.all 
  end

  def show
    @order = Order.find(params[:id])
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update_attributes(params[:order])
      redirect_to admin_orders_path, notice: "cap nhap thanh cong"
    else
      render action: "edit", notice: "errors"
    end
  end

  def destroy
    @order = Order.find(params[:id]).destroy
  end

end