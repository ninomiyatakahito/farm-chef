class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to post_path(@comment.post)
      else
      render "prototypes/show"
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:comment_text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
