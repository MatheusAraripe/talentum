class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.post = @post
    # @comment.user = current_user


    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(@post.id) }
        format.json
      else
        format.html { render "posts/:id", status: :unprocessable_entity }
        format.json
      end
    end

  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
