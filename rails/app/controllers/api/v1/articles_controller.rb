class Api::V1::ArticlesController < ApplicationController
  def index
    articles = Article.published.order_by_newest.page(params[:page] || 1).per(10)
    render json: articles
  end

  def show
    article = Article.published.find(params[:id])
    render json: article
  end
end
