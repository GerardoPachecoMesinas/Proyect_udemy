class ArticlesController < ApplicationController
  before_action :authenticate_autor!, except: %i[index show]  
  before_action :correct_autor, only: %i[edit update destroy]  
  before_action :set_article, only: %i[show edit update destroy]

  def show
  end

  def index
    @articles = Article.all.order("created_at DESC")
  end

  def new
    @article = current_autor.articles.build
  end

  def create
    @article = current_autor.articles.build(article_params)
    if @article.save
      redirect_to @article
    else
      render "new"
    end
  end

  def edit 
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Articulo modificado correctamente"
      redirect_to @article
    else
      render "edit"
    end
  end

  def destroy
    @article.destroy!
    redirect_to articles_path, :notice => "Autor eliminado correctamente"
  end

  private

    def article_params
      params.require(:article).permit(:title, :content, :autor_id)
    end

    def set_article
      @article = Article.find(params[:id])
    end

    def correct_autor
      @article = current_autor.articles.find_by(id: params[:id])
      redirect_to articles_path, notice: "No estas autorizado a editar este artículo" if @article.nil?
    end
end
