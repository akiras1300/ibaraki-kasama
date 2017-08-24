class EntriesController < ApplicationController

  def index
    @entry = Entry.page(params[:page]).order('published desc')
  end

  def show
    @entry = Entry.find(params[:id])
    if @entry.content.blank?
      @entry.content="この記事の内容は掲載元にてご覧ください"
    end
    @all_tag_list = ActsAsTaggableOn::Tag.all.pluck(:name)
  end


end
