class PlacesController < ApplicationController
  def index
    @places = Place.page(params[:page]).order('id desc')
    num=1
    @hash = Gmaps4rails.build_markers(@places) do |place, marker|
      inum=format("%03d", num)
      @title="#{num}:#{place.tag.name}"
      @arry ={"url" => "/assets/myicon/n#{inum}.png", "width"=> 32,"height"=>32}
      marker.lat place.lat
      marker.lng place.lng
      marker.infowindow @title
      marker.picture @arry
      marker.json({title: @title})
      num +=1
    end
  end

  def show
  end
end
