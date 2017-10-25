class PlacesController < ApplicationController
  include MyUtility
  include Geokit::Geocoders
  Geokit::default_units = :kms

  def index
    gettlist
    gon.tlist = @tlist
    @plat=36.3860257
    @plng=140.2541036
    if params[:id].present?
      @place = Place.find(params[:id])
      @plat=@place.lat
      @plng=@place.lng
      @places = Place.by_distance(origin: [@place.lat, @place.lng]).page(params[:page])
    else
      @places = Place.by_distance(origin: [@plat, @plng]).page(params[:page])
    end
    #@places = Place.page(params[:page]).order('id desc')
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
