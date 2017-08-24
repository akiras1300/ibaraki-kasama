class FeedsController < InheritedResources::Base
  def show
    @feed = Feed.find(params[:id])
    @entry = @feed.entries.page(params[:page]).order('published desc')
  end
  private
    def feed_params
      params.require(:feed).permit(:name, :rss, :description)
    end
end
