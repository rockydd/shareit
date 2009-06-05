class CreateFtpservers < ActiveRecord::Migration
  def self.up
    create_table :ftpservers do |t|
      t.string :url
      t.string :dsp
      t.string :user
      t.string :password
      t.timestamps
    end
  end

  def self.down
    drop_table :ftpservers
  end
end
