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
        render action: "edit" , notice: "errors"
      end
  end

  def create
    @comment = Comment.find(params[:comment])
    if @comment.save 
      redirect_to admin_comment_path(@comment), notice: "Create success #{@comment.id}"
    else
      render "new", notice: "Comment not created"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:success] = "Comment delete."
    redirect_to admin_comments_path
  end

  def new 
    @comment = Comment.new
  end

end