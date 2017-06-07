class AddUrlToFeeds < ActiveRecord::Migration[5.1]
  def change
    add_reference :feeds, :url, foreign_key: true
  end
end
