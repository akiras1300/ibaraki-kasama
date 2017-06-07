class AddFeedToUrls < ActiveRecord::Migration[5.1]
  def change
    add_reference :urls, :feed, foreign_key: true
  end
end
