
class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = params[:post_id]
    if @comment.save
      redirect_back(fallback_location: post_path(@comment.post.id))
    else
      puts @comment.errors.full_messages
      redirect_back(fallback_location: post_path(@comment.post.id))
    end
    
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_content)  # :comment_contentを許可する必要がある
  end
end
