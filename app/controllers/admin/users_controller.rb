class Admin::UsersController < Admin::BaseController
  def index   
    @users = User.all 
  end

  def show
    @user = User.find(params[:id])
  end

  def edit 
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    #binding.pry
    @user = User.new(params[:user])
    if @user.save
      redirect_to admin_user_path(@user), notice: "success"
    else
      render 'new', notice: "Cap nhap thanh cong"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "User delete."
    redirect_to admin_users_path
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to admin_user_path(@user), notice: 'Cap nhap thanh cong}' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
