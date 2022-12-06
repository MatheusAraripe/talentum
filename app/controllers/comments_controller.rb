class CommentsController < ApplicationController

  include ActionView::RecordIdentifier # adds `dom_id`

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.user = current_user

    authorize @comment

    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(@post) }
        format.json
      else
        format.html { render "posts/show", status: :unprocessable_entity }
        format.json
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post

    authorize @comment

    respond_to do |format|
      if @comment.destroy
        format.html { redirect_to post_path(@post, anchor: @post.comments.last) }
        format.json { head :no_content }
      else
        format.html { render "posts/show", status: :unprocessable_entity }
        format.json
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
