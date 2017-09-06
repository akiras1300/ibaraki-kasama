class TagsController < ApplicationController
  def index
    @tag = Tag.page(params[:page]).order('taggings_count desc').per(50)
  end

  def show
    @tag = Tag.find(params[:id])
    @entry = Entry.page.tagged_with(@tag.name).order('published desc')
  end

end
