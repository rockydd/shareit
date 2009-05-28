module ItemsHelper
  def item_picture(item)
    if(item.attachment_content_type =~ /^image/)
      return item.attachment.url
    else
      return item.thumb_url
    end
  end
end
