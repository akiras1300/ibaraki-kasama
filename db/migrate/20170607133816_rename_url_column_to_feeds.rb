class RenameUrlColumnToFeeds < ActiveRecord::Migration[5.1]
  def change
    rename_column :feeds, :url, :rss
  end
end
