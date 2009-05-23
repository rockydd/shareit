class Item < ActiveRecord::Base
  acts_as_taggable
  has_attached_file :attachment, :styles => { :small => '150x150>'}

  def thumb_url
    if attachment_content_type =~ /^image/
      attachment.url(:small)
    else
      ""
    end

  end
end
