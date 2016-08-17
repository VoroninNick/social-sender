class ArticlesController < ApplicationController
  before_action :set_article, only: [:publish]

  def index
    @articles = Article.published
  end

  def publish
    if @article
      @article.publish()
      render json: {}
    end
  end

  def set_article
    @article = Article.find(params[:id]) rescue render_not_found
  end
end