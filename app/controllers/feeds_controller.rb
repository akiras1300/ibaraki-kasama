class FeedsController < InheritedResources::Base
  before_action :user_check, only: [:index,:new,:edit,:update]
  def show
    @feed = Feed.find(params[:id])
    @entry = @feed.entries.page(params[:page]).order('published desc')
  end
  private
    def feed_params
      params.require(:feed).permit(:name, :rss, :description)
    end

    def user_check
      if current_admin_user.nil?
        redirect_to("/")
      end
    end
end
