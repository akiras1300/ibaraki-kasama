class FeedsController < InheritedResources::Base
  def show
    @feed = Feed.find(params[:id])
    @entry = @feed.entries.page(params[:page])
  end
  private
    def feed_params
      params.require(:feed).permit(:name, :rss, :description)
    end
end
