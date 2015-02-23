class ArticlesController < ApplicationController

  def index
    @articles = Article.all
    @category = Category.find(params[:category_id])
  end

  def show
    @category = Category.find(params[:category_id])
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
    @category = Category.find(params[:category_id])
  end

  def edit
    @article = Article.find(params[:id])
    @category = Category.find(params[:category_id])
  end

  def create
    @article = Article.create!(article_params)
    redirect_to category_articles_path
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to category_articles_path
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to category_articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :description, :category_id)
  end
end
