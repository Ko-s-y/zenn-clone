class Api::V1::ArticlesController < ApplicationController
  include Pagination

  def index
    articles = Article.preload(:user).published.order_by_newest.page(params[:page] || 1).per(10)
    render json: articles, meta: pagination(articles), adapter: :json
  end

  def show
    article = Article.published.find(params[:id])
    render json: article
  end
end
