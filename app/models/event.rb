class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :item

  def username
    user ? user.username : 'anonymous'
  end

  def description
    username + " shared " + item.name + "\n\n" +
    item.description
  end
end
