class EventsController < ApplicationController
  def index
      @nevents = Event.where("end >= ? and start <= ?", Date.today, Date.today)
      @fevents = Event.where("start > ?", Date.today).order('start')
      @eevents = Event.where("end < ?", Date.today).order('end desc')
  end

  def show
  end
end
