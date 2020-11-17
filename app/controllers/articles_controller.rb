class ArticlesController < ApplicationController
  before_action :find_article, except: [:index, :new, :create]
  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @articles = Article.new
  end

  def create
    @articles = Article.new(params_protect)
    @articles.save

    redirect_to root_path
  end

  private

  def find_article
    @articles = Article.find(params[:id])
  end

  def params_protect
    params.require(:article).permit(:title, :content)
  end
end
