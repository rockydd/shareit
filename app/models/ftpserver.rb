class Ftpserver < ActiveRecord::Base
  attr_accessible :url, :dsp, :user, :password, :maintainer
  validates_uniqueness_of :url
  validates_presence_of   :url
  def before_save
    unless self.url =~ /^ftp:/
      self.url = 'ftp://' + self.url
    end
  end

  def access_url
    if self.user.nil? || self.user == ""
      return self.url
    else
      return self.url.insert(6, "#{self.user}:#{self.password}@")
    end
  end
end
