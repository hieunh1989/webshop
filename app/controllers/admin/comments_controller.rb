class Admin::CommentsController < Admin::BaseController
  def index   
    @comments = Comment.all 
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
      if @comment.update_attributes(params[:comment])
        redirect_to admin_comments_path, notice: "Cap nhap thanh cong #{@comment.id}"
      else
        render action: "edit"
      end
  end

  def destroy

  end
end