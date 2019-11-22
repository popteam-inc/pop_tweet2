require File.expand_path(File.dirname(__FILE__) + "/environment")
set :output, 'log/crontab.log'
set :environment, :development

every 1.minute do
  rake 'autopost:tweet'
end

# every 10.minute do
#   rake 'autolike:tweet'
# end

# every 10.minute do
#   rake 'autounfollow:tweet'
# end

# every 10.minute do
#   rake 'autoununfollow:tweet'
# end
#
