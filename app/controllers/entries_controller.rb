class EntriesController < ApplicationController

  def index
    @entry = Entry.page(params[:page]).order('published desc')
  end

  def show
    @entry = Entry.find(params[:id])
  end
end
