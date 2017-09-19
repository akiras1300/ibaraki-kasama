namespace :sync do
  include ActionView::Helpers::TextHelper
  task feeds: [:environment] do
    Feedjira.logger.level = Logger::FATAL
    Feed.all.each do |feed|
      begin
        content = Feedjira::Feed.fetch_and_parse feed.rss
      content.entries.each do |entry|
       entry.summary=truncate(Sanitize.clean(entry.summary), length: 1000)
       local_entry = feed.entries.where(title: entry.title).first_or_initialize
       local_entry.update_attributes(content: entry.summary, author: feed.name, url: entry.url, published: entry.published)
        p "Synced Entry - #{entry.title} #{entry.published}"
      end
      rescue => e
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
      if entry.check.blank? && !(entry.feed.id==8)
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
                    unless url=="http://119.245.141.208/image/blog_t.jpg" and url=="http://www.city.kasama.lg.jp/data/img/1504048809_33.jpg"
                      if imagesise[0] > 200 && imagesise[1] > 200
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
      name2=tag.name
      if tag.oya.present?
        record = Tag.where(id: tag.oya).first
        if record.present?
          name2=record.name
        end
      end
      @ens = Entry.where("replace(replace(content,' ',''),'　','') like ? OR title like ?" ,"%" + tag.name + "%", "%" + tag.name + "%",).order('published desc').limit(100)
      unless @ens[0].blank?
        @ens.each do |entry|
          entry.tag_list.add(name2)
          p entry.title
          entry.save
        end
      end
    end
  end

  task spotset: [:environment] do
    seeds_dir  = "#{Rails.root}/db/seeds"
    csv_files = Dir.entries(seeds_dir).select {|f| f =~ /\.csv$/ }
    csv_files.each do |csv_file|
    p "#{csv_file} from csv"
    #model_name = File.basename(csv_file, '.csv')
    #model      = model_name.classify.constantize
    path = "#{seeds_dir}/#{csv_file}"
    p path
    csv  = CSV.read(path, headers: true)
      csv.each do |row|
        #p row
        # idが重複するレコードがある場合はupdate
        if row.has_key?('name')
          record = Tag.where(name: row['name']).first
            if record.blank?
              record =Tag.create(name: row['name'],tagtype_id:1)
            end
            if record.place.present?
              record.place.update(lat:row['lat'],lng:row['lng'])
            else
              p record.name
              Place.create(lat:row['lat'],lng:row['lng'],tag_id:record.id)
            end
        end
      end
    end
  end
  task placeset: [:environment] do
    @client = GooglePlaces::Client.new('AIzaSyB8eobPH6dNgK-AuwOEoD1ctLmQRvN1Aas')
    Place.all.each do |place|
      if place.pid.blank?
        places=@client.spots( place.lat,place.lng, :name => place.tag.name, :radius => 10, :language => 'ja')
        if places.present?
            p places.first.name
            place.update(pid:places.first.place_id,adress:places.first.vicinity,tel:places.first.formatted_phone_number,rate:places.first.rating,ptype:places.first.types.join(','))
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
