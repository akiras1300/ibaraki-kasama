namespace :sync do
  task feeds: [:environment] do
    Feed.all.each do |feed|
      content = Feedjira::Feed.fetch_and_parse feed.url
      content.entries.each do |entry|
        local_entry = feed.entries.where(title: entry.title).first_or_initialize
        local_entry.update_attributes(content: entry.content, author: entry.author, url: entry.url, published: entry.published)
        p "Synced Entry - #{entry.title}"
      end
      p "Synced Feed - #{feed.name}"
    end
  end
  task urls: [:environment] do
    Url.all.each do |url|
      feed_url = Feedbag.find( url.url )
      feedAry = feed_url.split(",")
      unless feedAry[0].empty?
        feed_url =feedAry[0].join()
        local_feed = Feed.where(url: feed_url).first_or_initialize
        local_feed.update_attributes(url: feed_url, name: url.title)
        p "Synced Feed - #{feed_url}"
      end
      p "Synced Url - #{url.title}"
    end
  end
end
