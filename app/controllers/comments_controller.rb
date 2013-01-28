class CommentsController < ApplicationController
  def create
  	@post = Post.find(params[:post_id])
  	@comment = @post.comments.build(params[:comment])
  	respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, :notice => 'Komentarz dodany' }
      else
        format.html { render "posts/show" }
      end
    end
  end

  def destroy
  	@comment = Comment.find(params[:id])
  	@comment.destroy

	redirect_to @comment.post  	
  end
end
