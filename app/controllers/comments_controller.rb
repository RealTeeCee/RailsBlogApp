class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ destroy ]
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.create(:commenter => params[:comment][:commenter], :body => params[:comment][:body], :post_id => params[:post_id])
    
    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(params[:post_id]), notice: "Comment was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end
 
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:commenter, :body, :post_id)
    end
 
end