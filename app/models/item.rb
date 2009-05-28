class Item < ActiveRecord::Base
  acts_as_taggable
  has_attached_file :attachment, :styles => { :small => '150x150>'}
  belongs_to :creator,:class_name => 'User'

  def thumb_url
    if attachment_content_type =~ /^image/
      attachment.url(:small)
    elsif attachment_content_type =~ /\/pdf$/
      attachment.url(:small).split("/")[0..-2].join("/") + "/thumb.png"
    elsif attachment_content_type =~ /x-msdos-program$/
      "/images/windows.png"
    elsif attachment_content_type =~ /zip$/ || attachment_file_name =~ /(tar|\.tgz)$/
      "/images/zip.png"
    else
      "/images/tux.png"
    end
  end

  def after_save
    if attachment_content_type =~ /\/pdf$/
      path = File.dirname(attachment.path)
      thumb_path = path.split("/")[0..-2].join("/") + "/small/thumb.png"
      src = attachment.path+"[0]"
      `convert -thumbnail x150 #{src} #{thumb_path}`
    end
  end
end
