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

  def new

  end

  def create
    @img = Img.new(img_params)
    if @img.save
      redirect_to img_path(@img)
    else
      render :action => 'new'
    end
  end

  def edit
   @img = Img.find(params[:id])
   @all_tag_list = ActsAsTaggableOn::Tag.all.pluck(:name);
  end

  def update
    @img = Img.find(params[:id])
    if @img.update(img_params)
      redirect_to img_path(@img)
    else
      render :action => 'edit'
    end
  end

  def img_params
    params.require(:img).permit(:title,:tag_list,:image,:inyo)
  end
end
