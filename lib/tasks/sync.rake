namespace :sync do
   include ActionView::Helpers::TextHelper
  task feeds: [:environment] do
    Feed.all.each do |feed|
      content = Feedjira::Feed.fetch_and_parse feed.rss
      content.entries.each do |entry|
        entry.content=truncate(ActionController::Base.helpers.strip_tags(entry.content), length: 1000)
        local_entry = feed.entries.where(title: entry.title).first_or_initialize
        local_entry.update_attributes(content: entry.content, author: entry.author, url: entry.url, published: entry.published)
        p "Synced Entry - #{entry.content}"
      end
      p "Synced Feed - #{feed.name}"
    end
  end

  task feedsreset: [:environment] do
    Entry.all.each do |entry|
      doc = Nokogiri::HTML(open(entry.url))
      #doc.css('img').each do |image|
        #p image.attribute("src").value
      #end
      entry.content=truncate(ActionController::Base.helpers.strip_tags(entry.content), length: 1000)
      entry.save
    end
  end

  task imgset: [:environment] do
    Entry.all.each do |entry|
      if entry.check.blank?
        entry.check =1
        entry.save
        p entry.title
        begin
          _html = open(entry.url)
        rescue OpenURI::HTTPError
          sleep 1
          next
        end
          doc = Nokogiri::HTML(_html)
          #imgタグだけ取得
          images = doc.css('img')
          # 100 x 100pxの画像があるかチェック
          if images.present?
              images.each do |image|
                  url = image.attributes["src"].value
                  imagesise=FastImage.size(url)
                  unless imagesise.blank?
                    unless url=="http://119.245.141.208/image/blog_t.jpg"
                      if imagesise[0] >= 150 && imagesise[1] >= 150
                        entry.remote_image_url =url
                        entry.save
                        p url
                        break
                      end
                    end
                  end
              end
          end
      end
    end
  end

  task tagset: [:environment] do
    Tag.all.each do |tag|
      @ens = Entry.where("content like ? OR title like ?" ,"%" + tag.name + "%", "%" + tag.name + "%",)
      unless @ens[0].blank?
        @ens.each do |entry|
          entry.tag_list.add(tag.name)
          p entry.title
          entry.save
        end
      end
    end
  end

  task urls: [:environment] do
    Url.all.each do |url|
      feed_url = Feedbag.find( url.url )
      feedAry = feed_url.join(",").split(",")
      unless feedAry[0].blank?
        feed_url =feedAry[0]
        local_feed = url.feeds.where(rss: feed_url).first_or_initialize
        local_feed.update_attributes(rss: feed_url, name: url.title)
        p "Synced Feed - #{feed_url}"
      end
      p "Synced Url - #{url.title}"
    end
  end
end
