require "#{Dir.pwd}/config/application.rb"
require File.expand_path(File.dirname(__FILE__) + '/environment')

# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
 every 5.minutes do
   # rake "some:great:rake:task"
   rake 'schedule_post'
 end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
