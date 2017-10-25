# 出力先logの指定
set :output, 'log/crontab.log'
# 実行環境の指定
set :environment, :development
env :PATH, ENV['PATH']

  every 1.hour do
    begin
      rake 'sync:feeds'
      rake 'sync:imgset'
      rake 'sync:tagset'
    rescue => e
      Rails.logger.error("aborted rake task")
      raise e
    end
  end
