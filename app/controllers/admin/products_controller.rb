class Admin::ProductsController < Admin::BaseController
  def index   
    @products = Product.all 
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    # binding.pry
    @product = Product.find(params[:id])
    @categories = @product.categories.map{|i| i}.join(",") unless @product.categories.nil?
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:success] = "Produt delete."
    redirect_to admin_products_path
  end

  def new 
    @product = Product.new
    3.times { @product.product_images.build }
  end

  def create
    params[:product][:categories] = params[:product][:categories].split(", ")
    @product = Product.new(params[:product])
    if @product.save
      redirect_to admin_product_path(@product), notice: "Create success #{@product.name}"
    else
      render 'new', notice: "Product not created"
    end
  end

  def update
    params[:product][:categories] = params[:product][:categories].split(",")
    @product = Product.find(params[:id])
    #binding.pry
    if @product.update_attributes(params[:product])

      redirect_to admin_product_path(@product), notice: "Update success #{@product.name}"
    else
      render action: "edit"
    end
  end
end
