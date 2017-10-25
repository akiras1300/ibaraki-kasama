class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :destroy,:url,:urlset]
  before_action :user_check, only: [:new, :create,:edit,:update,:img,:imgset,:url,:urlset]
  include MyUtility

  def index
    gettlist
    gon.tlist = @tlist
    @tagtypes = Tagtype.all
    if params[:type].present?
      if params[:type]=="10"
        @tag = Tag.where(tagtype:nil).page(params[:page]).order('taggings_count desc')
      else
        @tag = Tag.where(tagtype:params[:type],oya: nil).page(params[:page]).order('taggings_count desc')
        @tagtype = Tagtype.find(params[:type])
      end
    else
      @tag = Tag.where(oya: nil).page(params[:page]).order('taggings_count desc').per(50)
    end
  end

  def show
    gettlist
    gon.tlist = @tlist
    @tag = Tag.find(params[:id])
    impressionist(@tag, nil, :unique => [:session_hash])
    @page_views = @tag.impressionist_count
    @imgs = Img.tagged_with(@tag.name).limit(4)
    @entry = Entry.page.tagged_with(@tag.name).order('published desc')
    @events = Tag.tagged_with(@tag.name).where(tagtype: 4)
  end

  def new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to tag_path(@tag)
    else
      render :action => 'new'
    end
  end

  def edit
   @all_tag_list = ActsAsTaggableOn::Tag.all.pluck(:name);
   @tag.event = Event.new if @tag.event.blank?
   @tag.place = Place.new if @tag.place.blank?
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      redirect_to tag_path(@tag)
    else
      render :action => 'edit'
    end
  end

  def img
   @tag = Tag.find(params[:id])
  end

  def imgset
   @tag = Tag.find(params[:id])
   @img = Img.new(img_params)
   @img.tag_list.add(@tag.name)
   if @img.save
     redirect_to img_path(@img)
   else
     render :action => 'img'
   end
  end

  def url
  end

  def urlset
   @url = Url.new(url_params)
   @url.tag_id=@tag.id
   if @url.save
     redirect_to tag_path(@tag)
   else
     render :action => 'url'
   end
  end

  private
    def set_tag
      @tag = Tag.find(params[:id])
    end

    def tag_params
      params.require(:tag).permit(:name,:read,:body,:tagtype_id,:tag_list,:image,:inyo,:oya,:facebook,:twitter,:instagram, event_attributes: [:start,:end,:etc,:place], place_attributes: [:adress])
    end

    def img_params
      params.require(:img).permit(:title,:image,:inyo)
    end

    def url_params
      params.require(:url).permit(:title,:image,:url)
    end

    def user_check
      if current_admin_user.nil?
        redirect_to("/")
      end
    end
end
