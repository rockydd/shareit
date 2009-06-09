desc "Tweet message"
task :tweet => :environment do
  message = ENV["TWEET"]
  Tweet.tweet(message)
end
