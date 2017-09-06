class EntriesController < ApplicationController

  def index
    if params[:key].present?
      @entry = Entry.where("replace(replace(content,' ',''),'　','') like ? OR title like ?" ,"%" + params[:key] + "%", "%" + params[:key] + "%",).page(params[:page]).order('published desc')
      @key= params[:key];
    else
      @entry = Entry.page(params[:page]).order('published desc')
    end
  end

  def show
    @entry = Entry.find(params[:id])
    if @entry.content.blank?
      @entry.content="この記事の内容は掲載元にてご覧ください"
    end
    @all_tag_list = ActsAsTaggableOn::Tag.all.pluck(:name)
  end


end
