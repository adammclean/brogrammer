class CommentsController < ApplicationController

  #each request needs to keep track of article to which comment belongs to
  #that's why we begin with Article.find
  #the @article.comments.create method is available due to our association

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end

