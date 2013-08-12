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
    @user.encrypted_password = params[:user][:encrypted_password]
    if @user.save
      redirect_to admin_user_path(@user), notice: "success"
    else
      render 'new', notice: "Cap nhap thanh cong"
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User delete."
    redirect_to admin_users_path
  end
end
