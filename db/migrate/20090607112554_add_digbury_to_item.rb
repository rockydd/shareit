class AddDigburyToItem < ActiveRecord::Migration
  def self.up
    add_column :items, :digged, :integer
    add_column :items, :buried, :integer
  end

  def self.down
    remove_column :items, :buried
    remove_column :items, :digged
  end
end
