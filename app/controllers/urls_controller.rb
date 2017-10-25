class UrlsController < ApplicationController
  def index
      @url = Url.page(params[:page])
  end

  def facebook
    @sns = Tag.where("facebook != ?","").page(params[:page])
  end

  def twitter
    @sns = Tag.where("twitter != ?","").page(params[:page])
  end

  def instagram
    @sns = Tag.where("instagram != ?","").page(params[:page])
  end
end
