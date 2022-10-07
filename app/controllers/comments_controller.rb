class CommentsController < ApplicationController
  def new
    @comment = Comment.new(author: cookies[:commmenter_name])
  end
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:notice] = "thanks for your comment!"
      if params[:remember_name]
        cookies[:commmenter_name] = @comment.author
      else
        cookies.delete(:commmenter_name)
      end
      redirect_to @comment.article
    else
      render action: "new"
    end
  end
  
  def previews
    # return render json: {data: "error"}
      # flash[:notice] = "welcome to the team"
  end

  def show
    @comment = Comment.find(params[:id])
  end
end