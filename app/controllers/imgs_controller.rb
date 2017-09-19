class ImgsController < ApplicationController
  include MyUtility
  def index
    gettlist
    gon.tlist = @tlist
    @img = Img.page(params[:page])
  end

  def show
    gettlist
    gon.tlist = @tlist
    @img = Img.find(params[:id])
    impressionist(@img, nil, :unique => [:session_hash])
    @page_views = @img.impressionist_count
    @imgs=@img.find_related_tags.limit(6)
  end

end
