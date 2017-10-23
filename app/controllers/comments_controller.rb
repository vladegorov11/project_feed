class CommentsController < ApplicationController
  def create
   @feed = Feed.find(params[:feed_id])
  #  @comment = @feed.comments.create(comment_params)
   @comment = @feed.comments.new(comment_params)
   @comment.user_id = current_user.id
   @comment.author = current_user.nick_name
   @comment.save
   redirect_to feed_path(@feed)
 end

 def destroy
     @feed = Feed.find(params[:feed_id])
     @comment = @feed.comments.find(params[:id])
     if current_user.id == @comment.user_id # ||  current_user.id  == @feed.user_id
       @comment.destroy
       redirect_to feed_path(@feed)
     end
   end

 private
   def comment_params
     params.require(:comment).permit(:body)
   end
end
