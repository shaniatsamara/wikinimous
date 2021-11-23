class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @articles = params[:id]
    @article = Article.find(@articles)
  end

  def new
    @articles = Article.new
  end

  def create
    @article = Article.new(require_article_params)
    @article.save
    redirect_to articles_path(@article)
  end

  def edit
    @articles = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(require_article_params)
    redirect_to articles_path
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private

  def require_article_params
    params.require(:article).permit(:title, :context)
  end
end
