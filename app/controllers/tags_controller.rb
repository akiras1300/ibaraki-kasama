class TagsController < ApplicationController
  def index
    @tag = Tag.where(oya: nil).page(params[:page]).order('taggings_count desc').per(50)
  end

  def show
    @tag = Tag.find(params[:id])
    impressionist(@tag, nil, :unique => [:session_hash])
    @page_views = @tag.impressionist_count
    @entry = Entry.page.tagged_with(@tag.name).order('published desc')
  end

end
