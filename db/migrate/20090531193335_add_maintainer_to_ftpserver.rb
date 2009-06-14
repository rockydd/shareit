class AddMaintainerToFtpserver < ActiveRecord::Migration
  def self.up
    add_column :ftpservers, :maintainer, :string
  end

  def self.down
    remove_column :ftpservers, :maintainer
  end
end
