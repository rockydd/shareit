require 'rubygems'
require 'twitter'

class Tweet
  def self.tweet(message)
    httpauth = Twitter::HTTPAuth.new('letshareit', 'dongdong')
    base = Twitter::Base.new(httpauth)
    base.update(message)
  end
end
