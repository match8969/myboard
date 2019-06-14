# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever


# Sample: https://qiita.com/yumiyon/items/388fbb84450f49a6ab0d
require File.expand_path(File.dirname(__FILE__) + "/environment")
set :output, 'log/cron.log'

# 1分毎に回す
every 1.minute do
  command "echo 'mossmossmossmossmossmoss'"
end

every 3.hours do
  runner "MyModel.some_process"
  rake "my:rake:task"
  command "/usr/bin/my_great_command"
end