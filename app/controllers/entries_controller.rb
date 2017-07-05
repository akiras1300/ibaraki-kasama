class EntriesController < ApplicationController

  def index
    @entry = Entry.page(params[:page]).order('published desc')
  end

  def show
    @entry = Entry.find(params[:id])
    @all_tag_list = ActsAsTaggableOn::Tag.all.pluck(:name)
  end

  def update
    render :text => params
    params[:entry][:tag_list]
  end

end
