# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include Authentication
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  private
  def tweet(message)
    call_rake(:tweet,{ :TWEET=>message})
  end
  def call_rake(task, options = { })
    options[:rails_env] = Rails.env
    args = options.map { |n,v| "#{n.to_s.upcase}='#{v}'"}
    system "/usr/bin/rake #{task} #{args.join(' ')} >> #{Rails.root}/log/rake.log &"
  end
end
