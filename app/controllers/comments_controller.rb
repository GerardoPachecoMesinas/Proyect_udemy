class CommentsController < ApplicationController

  # POST /comments or /comments.json
  def create
    @article = Article.find(params[:article_id])  
    @comment = @article.comments.create(comment_params)

    redirect_to @article
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy!

    redirect_to @article
  end

  private

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:name, :text, :article_id)
    end
end
