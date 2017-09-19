class EntriesController < ApplicationController
  include MyUtility
  def index
    gettlist
    gon.tlist = @tlist
    if params[:key].present?
      @entry = Entry.where("replace(replace(content,' ',''),'　','') like ? OR title like ?" ,"%" + params[:key] + "%", "%" + params[:key] + "%",).page(params[:page]).order('published desc')
      @key= params[:key];
    else
      @entry = Entry.page(params[:page]).order('published desc')
    end
  end

  def show
    gettlist
    gon.tlist = @tlist
    @entry = Entry.find(params[:id])
    impressionist(@entry, nil, :unique => [:session_hash])
    @page_views = @entry.impressionist_count
    if @entry.content.blank?
      @entry.content="この記事の内容は掲載元にてご覧ください"
    end
    @entries=@entry.find_related_tags.limit(6)
    if @entries.present?
    else
      @feed = Feed.find(@entry.feed.id)
      @entries = @feed.entries.where.not(id: params[:id]).order('published desc').limit(6)
    end
    #tag_ids = @entry.tags.map { |c| c.id }.join(',')
    #@all_tag_list = ActsAsTaggableOn::Tag.all.pluck(:name)
    #@entries = Entry.includes(:tags).where(entries_tags: {tag_id: .tag_ids}).references(:tags)
  end

end
